require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "workout_security"
  end

  get "/" do
    if logged_in?
      @user = User.find(session[:user_id])
    else
      @user = nil
    end
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      if session[:user_id]
        @current_user = session[:user_id]
      end
    end
  end
end