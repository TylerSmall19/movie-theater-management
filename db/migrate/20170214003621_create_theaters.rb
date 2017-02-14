class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :address, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
