class TopicsController < ApplicationController
  respond_to :html

  before_filter -> { @topics = Topic.all }, only: :index
  before_filter -> { @topic = Topic.find params[:id] }, only: [:show, :edit, :update, :destroy]
  before_filter -> { @topic = Topic.new }, only: :new
  before_filter -> { @topic = Topic.new topic_params }, only: :create

  # POST /topics
  # POST /topics.json
  def create
    flash[:notice] = 'Topic was successfully created.' if @topic.save
    respond_with @topic
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    flash[:notice] = 'Topic was successfully updated.'  if @topic.update_attributes(topic_params)
    respond_with @topic
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_with @topic
  end

  def topic_params
    params.require(:topic).permit :name
  end
end
