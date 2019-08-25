class TipsController < ApplicationController

  def create
    response = Faraday.post("https://api.foursquare.com/v2/tips/add") do |request|
      request.params['oauth_token'] =
      session[:token]
      request.params['v'] = '20160201'
      request.params['venueId'] = params[:venue_id]
      request.params['text'] = params[:tip]
  end

    redirect_to tips_path



  def index
    response = Faraday.get("https://api.foursquare.com/v2/lists/self/tips") do |request|
      request.params['oauth_token'] = session[:token]
      request.params['v'] = '20160201'
    end
    @results = JSON.parse(response.body)["response"]["tips"]["items"]
  end

  end


end
