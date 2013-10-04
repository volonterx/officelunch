Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '604507528827.apps.googleusercontent.com', 'm6f3axJhuQyIOoWX60mk3gqH', {
      access_type: 'offline',
      scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
      redirect_uri:'http://localhost:3000/users/auth/google_oauth2/callback'
  }
end