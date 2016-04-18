class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to links_path
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash.now[:error] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Succesfully logged out!"
    redirect_to login_path
  end
end