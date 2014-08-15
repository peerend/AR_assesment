class ChangeShip < ActiveRecord::Migration
  def change
    drop_table :grunts

    create_table :projects do |t|
      t.string :name

      t.belongs_to :grunts
    end
  end
end
