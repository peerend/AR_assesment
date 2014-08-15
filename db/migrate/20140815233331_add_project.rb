class AddProject < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name

      t.belongs_to :grunts
    end
  end
end
