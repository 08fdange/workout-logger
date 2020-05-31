class ExercisesController < ApplicationController
    get '/exercises' do
        if logged_in?
            @exercises = Exercise.all.sort_by {|exercise| exercise[:exercise_name]}
            erb :"/exercises/show_all"
        else 
            redirect to '/'
        end
    end

    get '/exercises/:id' do
        admin = User.find_by(username: '08fdange')
        if logged_in?
            @exercise = Exercise.find(params[:id])
            erb :'/exercises/show'
        else
            redirect to '/'
        end
    end

    get '/new_exercises' do
        if logged_in?
            erb :'/exercises/new'
        else
            redirect to "/"
        end
    end

    post '/exercises' do
        params['exercises'].each do |key, value|
            if value['exercise_name'].present?
                Exercise.create(value)
            end
        end
        redirect to '/exercises'
    end

    get '/exercises/:id/edit' do
        @exercise = Exercise.find_by_id(params[:id])
        if logged_in?
            erb :'/exercises/edit'
        end
    end

    patch '/exercises/:id' do
        @exercise = Exercise.find_by_id(params[:id])
        @exercise.exercise_name = params['exercise_name'] if params['exercise_name'].present?
        @exercise.description = params['description'] if params['description'].present?
        @exercise.exercise_type = params['exercise_type'] if params['exercise_type'].present?
        @exercise.save
        redirect to "/exercises/#{@exercise.id}"
    end

    delete '/exercises/:id' do
        if admin?
            @exercise = Exercise.find(params[:id])
            @exercise.delete
            redirect to '/exercises'
        end
    end

end