class Admin::GreetingsController < Admin::AdminApplicationController

  def index
    ##only show the latest one?
    @greetings = Greeting.all
  end

  def show
    @current_greeting = Greeting.find(params["id"])
  end


  def new
    @greeting = Greeting.new
  end


  def create
    @greeting = Greeting.new greeting_params
    if @greeting.save
      redirect_to admin_greetings_path
    else
      render 'new'
    end
  end

  def edit
    @greeting = Greeting.find(params[:id])
  end

  def update
    @greeting = Greeting.find(params[:id])
    if @greeting.update(greeting_params)
      redirect_to admin_greetings_path
    else
      render 'edit'
    end
  end

  def destroy
    greeting = Greeting.find(params["id"])
    if greeting.destroy
      flash[:notice] = "Greeting successfully deleted"
      redirect_to admin_greetings_path
    else
      flash[:notice] = "Could not delete greeting"
      redirect_to admin_greetings_path
    end
  end





  private
    def greeting_params
      params.require(:greeting).permit(Greeting.column_names.map {|x| unless x == "id"; x.to_sym; end}.compact)
    end

end
