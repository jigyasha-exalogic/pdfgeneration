class AccountsController < ApplicationController
  def new
  	@acc=Account.new
  	@user = User.find(session[:user_id])
	end

		def create
		@error
    @acc = Account.new(acc_params)
    @acc.id = session[:user_id]
    @user = User.find(session[:user_id])
    if @acc.save
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
	end

	def edit
		@acc = Account.find(params[:id])
    @user = User.find(params[:id])
	end

	def update
 				@acc = Account.find(params[:id])
        @user = User.find(params[:id])
      if @acc.update(acc_params)
        redirect_to user_path(params[:id])
      else
        render 'edit'
      end
	end

  def payslip
    @user = User.find(session[:user_id])
  end
	private

  def acc_params
    params.require(:account).permit(:acno, :acname, :bankname, :ifsc, :branch, :userid)
  end

end
