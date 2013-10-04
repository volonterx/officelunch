class RefreshTokenServise
  require 'rest-client'

  attr_accessor :user

  APP_ID      = "604507528827.apps.googleusercontent.com"
  APP_SECRET  = "m6f3axJhuQyIOoWX60mk3gqH"

  def initialize(user)
    self.user = user
  end

  def refresh_token
    data = {
        :client_id => APP_ID,
        :client_secret => APP_SECRET,
        :refresh_token => user.refresh_google_token,
        :grant_type => "refresh_token"
    }
    response = ActiveSupport::JSON.decode(RestClient.post "https://accounts.google.com/o/oauth2/token", data)
    user.update_attribute(:google_token, response['access_token'])
  end

end