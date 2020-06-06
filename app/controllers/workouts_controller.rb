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
        @user = User.find_by(id: params[:user_id])
        @workout = Workout.new(title: params[:title], user_id: @user.id) 
        if params[:workout].present?
            params['workout']['exercise_ids'].each do |id|
                @workout.exercises << Exercise.find(id)
            end
        end
        params['exercise'].values.each {|name| @workout.exercises << Exercise.create(exercise_name: name) if name.present?}
        @workout.save
        redirect to '/workouts'
    end

    get '/workouts' do
        if logged_in?
            @user = User.find(session[:user_id])
            @workouts = @user.workouts
            erb :"/workouts/workouts"
        else 
            redirect to '/'
        end
    end

    get '/workouts/:id' do
        @user = User.find_by(id: session[:user_id])
        redirect_logged_out
        @workout = Workout.find_by(id: params[:id])
        erb :'/workouts/show_workout'
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