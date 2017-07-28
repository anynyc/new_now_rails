class Admin::DaysController < Admin::AdminApplicationController
  def index
    today = Day.where(date: Date.today).last
    first_day = Date.civil(Date.today.year, Date.today.month, 1)
    last_day = Date.civil(Date.today.year, Date.today.month, -1)
    # @days = Day.include("date").where("date BETWEEN (?) AND (?)", today.date - 30.days, today.date + 30.days)
    @month = Date.today.strftime("%B %Y")
    @month_number = Date.today.month
    @year_number = Date.today.year
    @days = Day.where("date BETWEEN (?) AND (?)", first_day, last_day)
    @days = @days.sort_by{|day| day.date }
  end

  def show
    @current_day = Day.find(params["id"])
    @posts = @current_day.posts
  end


  def month_down
    old_month_number = params["month"].to_i
    old_year_number = params["year"].to_i
    last_month_full_date = Date.civil(old_year_number, old_month_number).last_month

    @month_number = last_month_full_date.month
    @year_number = last_month_full_date.year
    @month = last_month_full_date.strftime("%B %Y")
    today = Day.where(date: Date.today).last
    first_day = Date.civil(@year_number, @month_number, 1)
    last_day = Date.civil(@year_number, @month_number, -1)
    # @days = Day.include("date").where("date BETWEEN (?) AND (?)", today.date - 30.days, today.date + 30.days)
    # @month = Date.today.strftime("%B %Y")
    # @month_number = Date.today.month
    # @year_number = Date.today.year
    if self.check_past_days(first_day, last_day) == false
      return false
    else
      @days = Day.where("date BETWEEN (?) AND (?)", first_day, last_day)
      @days = @days.sort_by{|day| day.date }

    end



  end


  def month_up

    Rails.logger.info "What is month from JS Listener #{params["month"].to_i}"
    Rails.logger.info "What is year from JS Listener #{params["year"].to_i}"



    old_month_number = params["month"].to_i
    old_year_number = params["year"].to_i
    next_month_full_date = Date.civil(old_year_number, old_month_number).next_month
    @month_number = next_month_full_date.month
    @year_number = next_month_full_date.year
    @month = next_month_full_date.strftime("%B %Y")
    today = Day.where(date: Date.today).last
    first_day = Date.civil(@year_number, @month_number, 1)
    last_day = Date.civil(@year_number, @month_number, -1)
    # @days = Day.include("date").where("date BETWEEN (?) AND (?)", today.date - 30.days, today.date + 30.days)
    # @month = Date.today.strftime("%B %Y")
    # @month_number = Date.today.month
    # @year_number = Date.today.year
    self.check_days(first_day, last_day)
    @days = Day.where("date BETWEEN (?) AND (?)", first_day, last_day)
    @days = @days.sort_by{|day| day.date }


  end


  def check_days first_day, last_day
    ##check to see if we have these days created
    start_date = first_day
    last_day = last_day
    while start_date <= last_day do
      if Day.find_by_date(start_date) != nil
        ##there is a day created already so don't make another one
      else
        ##this day has not been created so make it
        return false
      end
      start_date = start_date + 1.days
    end
  end

  def check_past_days first_day, last_day
    start_date = first_day
    if Day.find_by_date(start_date) == nil
      return false
    else
      return true
    end

  end

  private

end
