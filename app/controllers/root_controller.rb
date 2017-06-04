class RootController < ApplicationController
  def root_toggle
    if user_signed_in?
      redirect_to topics_path
    else
      redirect_to home_path
    end
  end
end
