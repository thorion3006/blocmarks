class LikesController < ApplicationController
  def index; end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    if @like.save
      flash[:notice] = 'Bookmark liked.'
    else
      flash[:alert] = 'There was an error liking the bookmark. Please try again.'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:notice] = 'Bookmark unliked.'
    else
      flash[:alert] = 'There was an error unliking the bookmark. Please try again.'
    end
    redirect_back(fallback_location: root_path)
  end
end
