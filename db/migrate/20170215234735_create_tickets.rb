class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.float      :price, null: false

      t.timestamps null: false
    end
  end
end
