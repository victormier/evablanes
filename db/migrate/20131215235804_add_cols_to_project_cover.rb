class AddColsToProjectCover < ActiveRecord::Migration
  def change
    add_column :projects, :cover_cols, :string
  end
end
