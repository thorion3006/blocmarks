class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_user

  def show
    @user = User.friendly.find(params[:id])
    @user_bookmarks = @user.bookmarks
    @used_topics = []
    @user_bookmarks.each do |bookmark|
      @used_topics << bookmark.topic unless @used_topics.include?(bookmark.topic)
    end


    @liked_bookmarks = @user.likes
    @liked_topics = []
    @liked_bookmarks.each do |like|
      @liked_topics << like.bookmark.topic unless @liked_topics.include?(like.bookmark.topic)
    end
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
    if request.path != user_path(@user)
      return redirect_to @user, status: :moved_permanently
    end
  end
end
