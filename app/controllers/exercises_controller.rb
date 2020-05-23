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
        if logged_in?
            @exercise = Exercise.find(params[:id])
            erb :'/exercises/show'
        else
            redirect to '/'
        end
    end

    delete '/exercises/:id' do
        @exercise = Exercise.find(params[:id])
        @exercise.delete
        redirect to '/exercises'
    end

end