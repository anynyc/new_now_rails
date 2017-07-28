class Admin::PostsController < Admin::AdminApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @day = Day.find(params["day"])
  end

  def create
    @post = Post.new post_params
    if @post.save
      @day = Day.find(@post.day_id)
      redirect_to admin_days_path(@day)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @day = Day.find(@post.day_id)

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @day = Day.find(@post.day_id)
      redirect_to admin_day_path(@day)
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params["id"])
    if post.save
      flash[:notice] = "Post successfully disabled"
      redirect_to admin_days_path
    else
      flash[:notice] = "Could not disable post"
      redirect_to admin_days_path
    end
  end

  private
    def post_params
      params.require(:post).permit(Post.column_names.map {|x| unless x == "id"; x.to_sym; end}.compact)
    end
end
