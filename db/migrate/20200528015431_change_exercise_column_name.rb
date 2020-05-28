class ChangeExerciseColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :exercises, :type, :exercise_type
  end
end
