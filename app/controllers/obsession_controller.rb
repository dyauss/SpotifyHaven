class ObsessionController < ApplicationController
  include HTTParty

  def index
    @artists = get_artists
  end

  private
    def get_artists
      response = HTTParty.get("https://api.spotify.com/v1/me/following?type=artist&limit=50", {
        headers: {
          'Content-Type' => 'application/x-www-form-urlencoded',
          Authorization: "Bearer " + cookies[:access_token],
        }
      })

      case response.code
        when 200
          response_data = JSON.parse(response.body)
          response_data['artists']['items']
        when 401
          puts "bad"
          get_access_token_refresh
          redirect_to '/'
        else
          puts "something's wrong: #{response}"
      end
    end
end