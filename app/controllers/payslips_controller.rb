class PayslipsController < ApplicationController
	def new
		@payslip = Payslip.new
		@user=User.find(params[:id])
		session[:copy]=@user.id
         
	end

	def create
		@error
		@payslip = Payslip.new(payslip_params)
		@user=User.find(session[:copy])
		@sal = Sal.find(session[:copy])
		@payslip.payslipid = @user.empid << @payslip.month.to_s.rjust(2,"0") << @payslip.year.to_s
		@payslip.userid = @sal.id
		@payslip.basic = @sal.basic
		@payslip.hra = @sal.hra
		@payslip.cca = @sal.cca
		if @payslip.save
			redirect_to "/jig/" << (@payslip.id).to_s
		else
			@error = "Payslip already generated"
			render "new"
		end
	end

	def show
		@payslip=Payslip.find(params[:id])
		@user=User.find_by(id: @payslip.userid)
		@sal=Sal.find_by(id: @payslip.userid)
		@acc=Account.find_by(id: @payslip.userid)
		@payslip.hra = @payslip.basic * (@sal.hra/100)
		@payslip.cca = @payslip.basic * (@sal.cca/100)
		@gross = @payslip.basic + @payslip.hra + @payslip.cca + @payslip.reim + @payslip.ta + @payslip.sa
		@ptc = ptc(@gross)
		@lopc = lopc(@payslip.basic, @payslip.lop)
		@deduction = @ptc + @lopc + @payslip.od
		@net = @gross - @deduction
		@salary_per_month = @net
		temp = @payslip.month.to_i.humanize
		dict = {"one" => "January", "two" => "Febraury", "three" => "March", "four" => "April", "five" => "May", "six" => "June", "seven" => "July", "eight" => "August", "nine" => "September", "ten" => "October", "eleven" => "November", "twelve" => "December"}
		@temp = dict[temp]
		respond_to do |format|
        format.html
        format.pdf do
        pdf = PayslipsPdf.new(@payslip,@temp)
        send_data pdf.render, filename: "payslip_#{@payslip.id}.pdf", type: "application/pdf"
      end
    end
	end

	def index
		@payslips = Payslip.select(:id,:payslipid, :userid).where(:userid=>params[:id])
	end

	private
	
	def payslip_params
    	params.require(:payslip).permit(:hra, :cca, :basic, :pt, :sa, :ta, :reim,:lop , :od, :month, :year, :payslipid, :userid)
    end

  	def ptc(spm)
    pt = 0
    if spm >= 15000
      pt = 200
    end 
    return pt
 	end

 	def lopc(basic, lop)
    l = (basic/30) * lop
    return l
  	end
end
