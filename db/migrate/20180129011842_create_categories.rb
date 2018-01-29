class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.references :product_informations, foreign_key: true
      t.string :rank
      t.string :category_type
      t.string :ladder

      t.timestamps
    end
  end
end
