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
      @workouts = Workout.all.sort_by {|workout| workout.id}.reverse
      @user = User.find(session[:user_id])
      @userslug = @user.slug
    else
      @user = nil
      @userslug = nil
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
        @userslug = User.find_by(id: session[:user_id]).slug
        @current_user
      end
    end

    def admin?
      admin = User.find_by(username: "08fdange")
      session[:user_id] == admin.id
    end 
  end
end
