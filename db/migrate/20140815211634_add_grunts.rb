class AddGrunts < ActiveRecord::Migration
  def change
    create_table :grunts do |t|
      t.string :name
      t.string :rank
      t.belongs_to :ships
    end
  end
end
