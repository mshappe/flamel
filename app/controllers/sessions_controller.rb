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
