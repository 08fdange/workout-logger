class AddDescriptionToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :description, :string
    add_column :exercises, :type, :string
  end
end
