class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts_feed
  end
end
