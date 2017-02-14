class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.references :theater, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.integer    :number
      t.integer    :capacity
      t.text       :description

      t.timestamps null: false
    end
  end
end
