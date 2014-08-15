class ChangeShip < ActiveRecord::Migration
  def change
    drop_table :grunts
  end
end
