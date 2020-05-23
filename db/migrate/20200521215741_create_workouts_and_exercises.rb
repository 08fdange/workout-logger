class CreateWorkoutsAndExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.integer :user_id
    end

    create_table :exercises do |t|
      t.string :exercise_name
      t.integer :rep
    end

    create_table :exercises_workouts, id: false do |t|
      t.belongs_to :workout 
      t.belongs_to :exercise
    end
  end
end
