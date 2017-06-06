class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks
    topics = {}
    @user_bookmarks.each do |bookmark|
      topics[bookmark.topic] = 1
    end
    @used_topics = topics.keys

    @liked_bookmarks = @user.likes
    topics = {}
    @liked_bookmarks.each do |like|
      topics[like.bookmark.topic] = 1
    end
    @liked_topics = topics.keys
  end
end
