class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :subtitle
      t.text :description
      t.string :slug
      t.integer :sort_order
      t.string :featured_project_picture
      t.string :cover_picture
      t.string :slider_picture
      t.boolean :published, default: false
      t.boolean :in_slider, default: false
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
