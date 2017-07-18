class Api::V1::TokensController < Api::ApiApplicationController

  def create
    ##only display last active greeting? active not set up yet
    @token = params["push_token"]

    if Token.find_or_create_by(push_token: @token)
      render :create, status: "201"
    else
      ##any error will do
      render :json => {status: "404"}
    end
  end


end
