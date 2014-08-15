class InitialCreate < ActiveRecord::Migration
  def change
      create_table :ships do |t|
      t.string :name
      t.timestamp
    end

    create_table :grunts do |t|
      t.string :name
      t.string :rank
      t.belongs_to :ship
    end
  end
end
