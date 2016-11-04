class CreateExercices < ActiveRecord::Migration
  def change
    create_table :exercices do |t|
      t.integer :duration_in_min
      t.text :workout
      t.date :workout_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
