class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by(email: params[:sender])
    if user.nil?
      email = params[:sender]
      name = email.split('@')[0]
      password = ('a'..'z').to_a.shuffle[0,8].join
      @user = User.create(
        name: name,
        uname: name,
        email: email,
        password: password
      )
    else
      @user = user
    end

    title = params[:subject]
    @topic = Topic.where('lower(title) = ?', title.downcase).first
    @topic ||= Topic.create(title: title)

    @bookmark = @topic.build(url: params['body-plain'], user_id: @user.id)
    @bookmark.save
    head 200
  end
end
