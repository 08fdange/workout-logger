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
        @user = User.find(session[:user_id])
        @workout = Workout.create(title: params[:title], user_id: @user.id)
        if !params['exercise']['exercise_name'].empty?
            @workout.exercises << Exercise.create(exercise_name: params['exercise']['exercise_name'])
        end
        if !params['exercise']['exercise_name2'].empty?
            @workout.exercises << Exercise.create(exercise_name: params['exercise']['exercise_name2'])
        end
        if !params['exercise']['exercise_name3'].empty?
            @workout.exercises << Exercise.create(exercise_name: params['exercise']['exercise_name3'])
        end
        if !params['exercise']['exercise_name4'].empty?
            @workout.exercises << Exercise.create(exercise_name: params['exercise']['exercise_name4'])
        end
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
        @workout = Workout.find(params[:id])
        erb :'/workouts/show_workout'
    end

    delete '/workouts/:id/delete' do
        @workout = Workout.find(params[:id])
        @workout.delete
        redirect to '/workouts'
    end

    get '/workouts/:id/edit' do
        @workout = Workout.find(params[:id])
        erb :'/workouts/edit_workout'
    end

    patch '/workouts/:id' do
        @workout = Workout.find(params[:id])
        @workout.title = params[:title]
        @workout.save
        redirect to "/workouts/#{@workout.id}"
    end
end