class ChangeTableModelName < ActiveRecord::Migration
  def change
    rename_table :exercices , :exercises
  end
end
