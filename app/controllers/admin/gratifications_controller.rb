class Admin::GratificationsController < Admin::AdminApplicationController

  def index
    @gratifications = Gratification.all
  end

  def show
    @current_gratification = Gratification.find(params["id"])
  end


  def new
    @gratification = Gratification.new
  end


  def create
    @gratification = Gratification.new gratification_params
    if @gratification.save
      redirect_to admin_gratifications_path
    else
      render 'new'
    end
  end

  def edit
    @gratification = Gratification.find(params[:id])
  end

  def update
    @gratification = Gratification.find(params[:id])
    if @gratification.update(gratification_params)
      redirect_to admin_gratifications_path
    else
      render 'edit'
    end
  end

  def destroy
    gratification = Gratification.find(params["id"])
    if gratification.destroy
      flash[:notice] = "Gratification successfully deleted"
      redirect_to admin_gratifications_path
    else
      flash[:notice] = "Could not delete gratification"
      redirect_to admin_gratifications_path
    end
  end





  private
    def gratification_params
      params.require(:gratification).permit(Gratification.column_names.map {|x| unless x == "id"; x.to_sym; end}.compact)
    end

end
