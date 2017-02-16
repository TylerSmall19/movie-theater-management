class ChangeTableTicketsAddReferencesOrder < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
      t.references :order, index: true, foreign_key: true, null: false
    end
  end
end
