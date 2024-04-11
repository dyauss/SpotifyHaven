class ApplicationController < ActionController::Base
  include HTTParty

  # before_action :get_token

  private
    def get_token
      response = HTTParty.post("https://accounts.spotify.com/api/token", {
        body: 
          "grant_type=client_credentials&client_id=" + ENV['CLIENT_ID'] + "&client_secret=" + ENV['CLIENT_SECRET'],
        headers: {
          'Content-Type' => 'application/x-www-form-urlencoded',
          'charset' => 'utf-8'
        }
      })
      response_data = JSON.parse(response.body)
      puts response_data['access_token']
    end

    def artist

    end
end