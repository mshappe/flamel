class UsersController < ApplicationController
  respond_to :html

  before_filter -> { @users = User.all }, only: :index
  before_filter -> { @user = User.find params[:id] }, only: [:show, :edit, :update, :destroy]
  before_filter -> { @user = User.new }, only: :new
  before_filter -> { @user = User.new user_params}, only: :create

  def create
    flash[:notice] = "User has been successfully created" if @user.save
    respond_with @user
  end

  def update
    flash[:notice] = "User has been successfully updated" if @user.update_attributes user_params
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  def user_params
    params.require(:user).permit :username, :email, :password, :password_confirmation, :is_admin
  end
end
