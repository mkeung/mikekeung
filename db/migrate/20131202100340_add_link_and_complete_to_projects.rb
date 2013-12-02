class AddLinkAndCompleteToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :external_link, :string, default: ""
  	add_column :projects, :completed, :boolean
  end
end
