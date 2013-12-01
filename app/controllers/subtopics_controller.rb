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

class SubtopicsController < ApplicationController
  respond_to :html, except: [:index]

  before_filter -> { @topic = Topic.find(params[:topic_id]) }
  before_filter -> { @subtopic = Subtopic.find(params[:id]) }, only: [:show, :edit, :update, :destroy, :add_people, :remove_people]
  before_filter -> { @subtopic = @topic.subtopics.build }, only: :new
  before_filter -> { @subtopic = @topic.subtopics.build subtopic_params }, only: :create

  # Minimized controllers are fun!

  # POST /subtopics
  # POST /subtopics.json
  def create
    flash[:notice] = 'Subtopic was successfully created.' if @subtopic.save
    respond_with @topic, @subtopic
  end

  # PUT /subtopics/1
  # PUT /subtopics/1.json
  def update
    flash[:notice] = 'Subtopic was successfully updated.' if @subtopic.update_attributes(subtopic_params)
    respond_with @topic, @subtopic
  end

# DELETE /subtopics/1
# DELETE /subtopics/1.json
  def destroy
    @subtopic.destroy
    respond_with @topic, @subtopic, location: @topic
  end

  def add_people
    p params[:subtopic][:person_ids]
    @subtopic.people.push(Person.where id: params[:subtopic][:person_ids].compact)
    redirect_to topic_subtopic_path(@topic, @subtopic)
  end

  def remove_people
    @subtopic.people.delete(Person.where id: params[:subtopic][:person_ids].compact)
    redirect_to topic_subtopic_path(@topic, @subtopic)
  end

  def subtopic_params
    params.require(:subtopic).permit :name
  end

end
