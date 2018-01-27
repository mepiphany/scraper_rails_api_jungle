class CreateProductInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :product_informations do |t|
      t.string :product_img
      t.string :product_name
      t.integer :num_customer_reviews
      t.string :base_category
      t.string :sub_categories
      t.integer :base_rank
      t.integer :sub_rank
      t.string :product_dimensions
      t.decimal :price
      t.decimal :sale_price
      t.decimal :saved_amount
      t.string :asin

      t.timestamps
    end
  end
end
