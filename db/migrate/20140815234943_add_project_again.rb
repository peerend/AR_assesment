class AddProjectAgain < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.belongs_to :grunt
    end
  end
end
