class TokenController < ApplicationController
  def refresh
    get_access_token_refresh
  end

  private
    def get_access_token_refresh
      response = HTTParty.post("https://accounts.spotify.com/api/token", {
        body: 
          "grant_type=refresh_token&refresh_token=" + cookies[:refresh_token],
        headers: {
          'Content-Type' => 'application/x-www-form-urlencoded',
          Authorization: "Basic " + ENV['BASE_64_AUTHORIZATION'],
        }
      })
      response_data = JSON.parse(response.body)
      cookies[:access_token] = response_data['access_token']
      # response_data['access_token']
      puts response_data
    end
end
