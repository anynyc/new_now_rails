class PushAlert
  TYPES = ["gameResult"]
  def initialize token: nil, notification: nil, alert: nil
    # @token = token
    # @notifiction = notification
    # @alert = alert

    @token = token
    @notification = notification
    @alert = alert
    #commenting out to test
    self.setup(@notification)
    # setup("test", "This is a test message Michael")
    # create_notification("a9367d670f3e1801332119b197778458c4211f0356755115a1e1f904642f641a", "test", "This is a test message Michael")

  end

  def setup title
    if title && Rpush::Apns::App.find_by_name(title).nil?
      app = Rpush::Apns::App.new
      app.name = title
      # app.certificate = File.read("#{Rails.root}/any_app_development.pem")
      # app.environment = "development" # APNs environment.
      app.certificate = File.read("#{Rails.root}/any_app_production.pem")
      app.environment = "production" # APNs environment.
      app.password = ""
      app.connections = 1
      app.save!
    end
  end

  def create_notification
    if @token && @notification && @alert
      n = Rpush::Apns::Notification.new
      n.app = Rpush::Apns::App.find_by_name(@notification)
      n.device_token = @token
      n.alert = @alert
      n.sound = "default"
      n.data = { foo: :bar }
      n.save!
      if n.delivered == true
        return "success!"
      else
        return n.error_description
      end
    end
  end

  def success?
    return true if self[:status] == 200
  end

  def push_type(type)
    if Rpush::Apns::App.find_by_name(type)
      return {status: 200, message: 'success'}
    else
      return {status: 400, message: 'does not exist'}
    end
  end

  # def self.challenged
  #   if user.push_token
  #       push = PushNotification.new
  #     push.setup("test", "This is a test message Michael")
  #     push.create_notification(user.push_token, "proveit.devshop.nyc", "This is a test message Michael")
  #   end
  # end





end
