class Exercise < ActiveRecord::Base
    has_and_belongs_to_many :workouts
    validates :exercise_name, uniqueness: true
end