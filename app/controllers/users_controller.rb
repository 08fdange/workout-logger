class UsersController < ApplicationController
    
    get '/signup' do
        if !logged_in?
            erb :'/users/signup'
        else
            redirect to '/'
        end
    end

    post '/signup' do
        user = User.new(email: params[:email], username: params[:username], password: params[:password])
        if !user.valid?
            erb :'/users/duplicate'     
        elsif user.username !="" && user.password != nil
            user.save
            redirect to '/login'
        end
    end 

    get '/login' do
        if logged_in?
            redirect to '/'
        else
            erb :'/users/login'
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/'
        else
            redirect '/login'
        end
    end 

    get '/logout' do
        session.clear
        redirect to '/'
    end

    get '/users/:slug' do
        if logged_in?
            @user = User.find_by_slug(params[:slug])
            erb :'/users/show'
        end
    end

    get '/users/:slug/edit' do
        @user = User.find_by_slug(params[:slug])
        if logged_in? && @user == User.find_by_id(session[:user_id])
            erb :"/users/edit"
        end
    end

    patch '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        @user.bio = params['bio']
        if logged_in? && @user == User.find_by_id(session[:user_id])
            @user.save
        end
        redirect to "/users/#{ @user.slug }"
    end

end