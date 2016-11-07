class Exercice < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :duration_in_min
  validates_numericality_of :duration_in_min , only_integer:true
  validates_presence_of :workout
  validates_presence_of :workout_date
  validates_presence_of :user_id
  
end
