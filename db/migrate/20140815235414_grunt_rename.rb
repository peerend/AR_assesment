class GruntRename < ActiveRecord::Migration
  def change

    drop_table :projects

    create_table :projects do |t|
      t.string :name

      t.belongs_to :grunt
    end
  end
end
