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
		@payslip.basic = @payslip.gross / (1+(@sal.hra/100)+(@sal.cca/100)+(@sal.sa/100)+(@sal.ta/100))
		@payslip.hra = @payslip.basic * (@sal.hra/100)
		@payslip.cca = @payslip.basic * (@sal.cca/100)
		@payslip.sa = @payslip.basic * (@sal.sa/100)
		@payslip.ta = @payslip.basic * (@sal.ta/100)
		if @payslip.gross >= 15000
			@payslip.update(pt: 200)
		end
		temp = (@payslip.gross/30)*@payslip.lop
		@payslip.update(lop: temp)
		@payslip.net = (@payslip.gross - (@payslip.lop + @payslip.od + @payslip.pt))
		if @payslip.save
			redirect_to payslip_path(@payslip)
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

	def destroy
		@payslip=Payslip.find(params[:id])
		user = User.find_by(id: @payslip.userid)
		@payslip.delete
		redirect_to show_all_path(user)
	end

	private
	
	def payslip_params
    	params.require(:payslip).permit(:gross,:net,:ctc,:hra, :cca, :basic, :pt, :sa, :ta, :reim,:lop , :od, :month, :year, :payslipid, :userid)
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
