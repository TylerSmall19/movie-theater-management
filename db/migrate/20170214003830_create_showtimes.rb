class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.references :movie, index: true, foreign_key: true, null: false
      t.time :time, null: false
      t.references :screen, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
