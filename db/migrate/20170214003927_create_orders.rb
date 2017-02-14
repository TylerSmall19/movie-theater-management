class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string     :email, null: false
      t.string     :name, null: false
      t.string     :credit_card, null: false
      t.date       :expiration, null: false
      t.references :showtime, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
