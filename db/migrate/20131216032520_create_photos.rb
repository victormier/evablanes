class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :picture
      t.integer :sort_order
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
