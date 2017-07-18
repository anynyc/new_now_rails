class Admin::PushNotificationsController < Admin::AdminApplicationController

  def index
    @push_notifications = PushNotification.all
  end

  def show
    @current_push_notification = PushNotification.find(params["id"])
  end


  def new
    @push_notification = PushNotification.new
  end


  def create
    @push_notification = PushNotification.new push_notification_params
    if @push_notification.save
      redirect_to admin_push_notifications_path
    else
      render 'new'
    end
  end

  def edit
    @push_notification = PushNotification.find(params[:id])
  end

  def update
    @push_notification = PushNotification.find(params[:id])
    if @push_notification.update(push_notification_params)
      redirect_to admin_push_notifications_path
    else
      render 'edit'
    end
  end

  def destroy
    push_notification = PushNotification.find(params["id"])
    if push_notification.destroy
      flash[:notice] = "Notification successfully deleted"
      redirect_to admin_push_notifications_path
    else
      flash[:notice] = "Could not delete notification"
      redirect_to admin_push_notifications_path
    end
  end


  def send_out
    @push_notification = PushNotification.find(params["format"])
    @tokens = Token.all
    @tokens.each do |token|
      push_alert = PushAlert.new(
        token: token,
        notification: "New Articles",
        alert: "#{@push_notification.message}!"
      )
      response = push_alert.create_notification
      Rails.logger.info response
    end
  end




  private
    def push_notification_params
      params.require(:push_notification).permit(PushNotification.column_names.map {|x| unless x == "id"; x.to_sym; end}.compact)
    end

end
