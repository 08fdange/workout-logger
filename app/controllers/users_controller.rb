class UsersController < ApplicationController
    
    get '/signup' do
        if !logged_in?
            erb :'/users/signup'
        else
            redirect to '/'
        end
    end

    post '/signup' do
        @user = User.create(email: params[:email], username: params[:username], password: params[:password])
    end

end