class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :learning
      t.string :github

      t.timestamps
    end
  end
end
