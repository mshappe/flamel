# Copyright 2013 Michael Scott Shappe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
