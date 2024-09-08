class HomeController < ApplicationController
  def index
    @posts = current_user.posts_feed
  end
end
