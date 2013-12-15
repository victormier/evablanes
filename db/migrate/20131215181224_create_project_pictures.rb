class CreateProjectPictures < ActiveRecord::Migration
  def change
    create_table :project_pictures do |t|
      t.string :picture
      t.integer :sort_order
      t.integer :project_id

      t.timestamps
    end
  end
end
