class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description, :limit => 1000
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2
      t.string :author
      t.string :publisher

      t.timestamps
    end
  end
end
