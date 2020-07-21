class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :exercises
      t.date :date
      t.reference :user

      t.timestamps
    end
  end
end
