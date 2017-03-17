class Admin::DaysController < Admin::AdminApplicationController
  def index
    @days = Day.all
  end

  def show
    @current_day = Day.find(params["id"])
    @posts = @current_day.posts
  end




  private

end
