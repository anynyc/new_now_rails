class Api::V1::GreetingsController < Api::ApiApplicationController
  # GET /greetings
  # GET /greetings.json
  def index
    ##only display last active greeting? active not set up yet
    @greeting = Greeting.last

  end


end
