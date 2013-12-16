class AddCoverTitleToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :cover_title, :string
  end
end
