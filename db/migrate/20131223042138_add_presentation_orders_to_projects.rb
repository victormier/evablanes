class AddPresentationOrdersToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :slider_order, :integer
    add_column :projects, :featured_order, :integer
  end
end
