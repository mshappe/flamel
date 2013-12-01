class SessionsController < ApplicationController
  skip_before_filter :require_login
  before_filter -> { @user = User.find_by username: params[:session][:username] }, only: :create

  def create
    if @user && @user.authenticate(params[:session][:password])
      flash[:notice] = "Successfully logged in"
      sign_in @user
      redirect_to root_url
    else
      flash.now[:error] = "Login failed"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
