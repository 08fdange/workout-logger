class WorkoutsController < ApplicationController

    get '/workouts/new' do
        @exercises = Exercise.all 
        if logged_in?
            erb :'/workouts/new'
        else
            redirect to '/'
        end
    end

    post '/workouts/new' do
        @user = User.find_by_id(session[:user_id])
        @workout = Workout.create(title: params[:title], user_id: @user.id)
        @workout.update(params[:workout]) if params[:workout].present?
        params['exercise'].values.each {|name| @workout.exercises << Exercise.create(exercise_name: name) if name.present?}
        redirect to '/workouts'
    end

    get '/workouts' do
        if logged_in?
            @user = User.find(session[:user_id])
            @workouts = []
            Workout.all.each do |workout|
                if workout.user_id == @user.id
                    @workouts << workout
                end
                @workouts
            end    
            erb :"/workouts/workouts"
        else 
            redirect to '/'
        end
    end

    get '/workouts/:id' do
        @user = User.find_by(id: session[:user_id])
        if logged_in?
            @workout = Workout.find_by(id: params[:id])
            erb :'/workouts/show_workout'
        end
    end

    delete '/workouts/:id' do
        @user = User.find_by(id: session[:user_id])
        @workout = Workout.find_by(id: params[:id])
        if logged_in? && (@user.id == @workout.user_id || @user.username == "08fdange")
            @workout.delete
            redirect to '/workouts'
        end
    end

    get '/workouts/:id/edit' do
        @user = User.find_by(id: session[:user_id])
        @workout = Workout.find_by(id: params[:id])
        @exercises = Exercise.all
        if @workout && (@workout.user_id == @user.id || @user.username == "08fdange")
            erb :'/workouts/edit_workout'
        else
            redirect back
        end
    end

    patch '/workouts/:id' do
        @user = User.find_by(id: session[:user_id])
        @workout = Workout.find_by(id: params[:id])
        if logged_in? && (@user.id == @workout.user_id || @user.username == "08fdange")
            @workout.title = params[:title] if params[:title].present?
            @workout.update(params[:workout]) if params[:workout].present?
            @workout.save
            redirect to "/workouts/#{@workout.id}"
        end
    end
end