class ChangeShowtimesAddColumnPrice < ActiveRecord::Migration
  def change
    change_table :showtimes do |t|
      t.float :price
    end
  end
end
