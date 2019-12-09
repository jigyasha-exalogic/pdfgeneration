class UsersController < ApplicationController
  before_action :admin?, except: [:show]
  before_action :user?, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    session[:temp]="new"
  end

  def create
    @error
    @user = User.new(user_params)
    if @user.save
      @user.update(empid: (@user.id.to_s.rjust(4,"0"))) 
      session[:user_id]=@user.id
      redirect_to new_sal_path
    else
      @error = "Please check your email-id and password"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @sal=Sal.find(params[:id])
    @hrac = hrac(@sal.basic, @sal.hra)
    @ccac = ccac(@sal.basic, @sal.cca) 
    @gross = @sal.basic + @hrac + @ccac + @sal.reim + @sal.ta + @sal.sa
    @itc = itc(@gross * 12)
    @ptc = ptc(@gross)
    @lopc = lopc(@sal.basic,@sal.lop)
    if @itc!=0
      @deduction = (@itc/12) + @ptc + @lopc + @sal.od
    else
      @deduction = @ptc + @lopc + @sal.od
    end
    @net = @gross - @deduction
    @salary_per_month = @net
    @acc=Account.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    session[:temp]="edit"
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to edit_sal_path
      else
        render 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id])
    @sal = Sal.find(params[:id])
    @acc = Account.find(params[:id])
    @user.delete
    @sal.delete
    @acc.delete
    redirect_to '/users'
  end

  private

  def user_params
  params.require(:user).permit(:email, :password, :password_confirmation, :fname, :lname, :age,:date_of_joining,:salary_per_annum, :salary_per_month, :phonenumber, :address, :blood_type, :emergency_name,:emergency_number, :primary_skill, :secondary_skill1, :secondary_skill2, :notice, :gender, :state, :pincode, :city, :country)
  end

  def admin?
    unless session[:user_type]=="admin"
      redirect_to root_path
    end
  end

  def user?
    if session[:user_type]==nil
     redirect_to root_path
    end
  end

  def itc(spa)
    if spa <= 250000
      it = 0
    elsif spa.between?(250001,500000)
      it = (spa - 250000) * 0.05
    elsif spa.between?(500001,1000000)
      it = 12500 + (0.20 * (spa - 500000))
    elsif spa > 1000000
      it = 112500 + (0.30 * (spa - 1000000))
    end
    return it 
  end

  def ptc(spm)
    pt = 0
    if spm >= 15000
      pt = 200
    end 
    return pt
  end

  def hrac(basic, hr)
    h = @sal.basic * @sal.hra/100
    return h
  end

  def ccac(basic, cc)
    c = @sal.basic * @sal.cca/100
    return c
  end

  def lopc(basic, lop)
    l = (@sal.basic/30) * lop
    return l
  end
end

