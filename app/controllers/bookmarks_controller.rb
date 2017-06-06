class BookmarksController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user_id = current_user.id
    authorize @bookmark
    if @bookmark.save
      flash[:notice] = 'Bookmark saved successfully.'
    else
      flash[:alert] = 'There was an error saving the bookmark. Please try again.'
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = 'Bookmark updated successfully.'
    else
      flash[:alert] = 'There was an error saving the bookmark. Please try again.'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = 'Bookmark deleted successfully.'
    else
      flash[:alert] = 'There was an error deleting the bookmark. Please try again.'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
