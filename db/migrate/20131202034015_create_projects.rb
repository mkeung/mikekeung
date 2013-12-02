class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :learning
      t.string :github, default: ""

      t.timestamps
    end
  end
end
