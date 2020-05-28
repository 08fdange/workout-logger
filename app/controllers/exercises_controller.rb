class ExercisesController < ApplicationController
    get '/exercises' do
        if logged_in?
            @exercises = Exercise.all
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

    delete '/exercises/:id' do
        if admin?
            @exercise = Exercise.find(params[:id])
            @exercise.delete
            redirect to '/exercises'
        end
    end

end