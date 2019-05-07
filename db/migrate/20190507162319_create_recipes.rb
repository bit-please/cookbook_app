class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :title
      t.string :directions
      t.string :chef
      t.string :image_url
      t.integer :prep_time

      t.timestamps
    end
  end
end
