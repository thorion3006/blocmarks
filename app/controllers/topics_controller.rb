class TopicsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @user = current_user
    @topic = @user.topics.build(topic_params)
    if @topic.save
      flash[:notice] = 'Topic was saved successfully.'
      redirect_to @topic
    else
      flash[:alert] = 'Error creating  topic. Please try again.'
      redirect_to topics_path
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)
    if @topic.save
      flash[:notice] = 'Topic was updated successfully.'
    else
      flash[:alert] = 'There was an error saving the topic. Please try again.'
    end
    redirect_to @topic
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = 'There was an error deleting the topic. Please try again.'
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
