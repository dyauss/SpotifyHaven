class CallbackController < ApplicationController
  include HTTParty

  # before_action :get_code_param

  def index
    code_from_spotify = params[:code]
    puts 'passs ' + code_from_spotify
    access_token = get_access_token(code_from_spotify)
    my_method(access_token)
  end

  private
    def get_access_token(code)
      response = HTTParty.post("https://accounts.spotify.com/api/token", {
        body: 
          "grant_type=authorization_code&code=" + code + "&redirect_uri=" + ENV['REDIRECT_URI'],
        headers: {
          'Content-Type' => 'application/x-www-form-urlencoded',
          Authorization: "Basic " + ENV['BASE_64_AUTHORIZATION'],
        }
      })
      response_data = JSON.parse(response.body)
      response_data['access_token']
      # puts response_data
    end

    def my_method(access_token)
      response = HTTParty.get("https://api.spotify.com/v1/me", {
        headers: {
          'Content-Type' => 'application/x-www-form-urlencoded',
          Authorization: "Bearer " + access_token,
        }
      })
      response_data = JSON.parse(response.body)
      puts 'truncheons and shields'
      puts response_data
    end
end
