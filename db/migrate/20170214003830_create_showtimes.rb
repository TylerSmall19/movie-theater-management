class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.references :movie, index: true, foreign_key: true
      t.time :time
      t.references :screen, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
