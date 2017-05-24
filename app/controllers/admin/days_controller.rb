class Admin::DaysController < Admin::AdminApplicationController
  def index
    today = Day.where(date: Date.today).last
    # @days = Day.include("date").where("date BETWEEN (?) AND (?)", today.date - 30.days, today.date + 30.days)
    @days = Day.where("date BETWEEN (?) AND (?)", today.date - 30.days, today.date + 30.days)
    @days = @days.sort_by{|day| day.date }
  end

  def show
    @current_day = Day.find(params["id"])
    @posts = @current_day.posts
  end




  private

end
