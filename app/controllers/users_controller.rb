class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
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
end
