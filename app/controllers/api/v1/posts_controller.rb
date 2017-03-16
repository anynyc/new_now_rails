class Api::V1::PostsController < Api::ApiApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end


end
