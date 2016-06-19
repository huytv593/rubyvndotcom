class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :featured_image

      t.timestamps null: false
    end
  end
end
