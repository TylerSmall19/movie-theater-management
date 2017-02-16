class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.float      :price, null: false
      t.references :showtime, index: true, foreign_key: true, null: false
      t.string     :name, null: false
      t.string     :email, null: false

      t.timestamps null: false
    end
  end
end
