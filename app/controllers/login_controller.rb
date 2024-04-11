class LoginController < ApplicationController
  before_action :define_env

  def index
    redirect_to "https://accounts.spotify.com/authorize?client_id=#{ENV['CLIENT_ID']}&response_type=code&redirect_uri=#{ENV['REDIRECT_URI']}&scope=#{ENV['SCOPE']}", allow_other_host: true
  end

  private
    def define_env
      @endpoint = 'https://accounts.spotify.com'
      @client_id = ENV['CLIENT_ID']
      @client_secret = ENV['CLIENT_SECRET']
      @scope = ENV['SCOPE']
    end
end