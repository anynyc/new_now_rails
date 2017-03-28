class Api::V1::PostsController < Api::ApiApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @current_day = Day.today
    @posts = @current_day.get_posts
  end


end
