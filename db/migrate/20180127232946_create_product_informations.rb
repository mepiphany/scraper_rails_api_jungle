class CreateProductInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :product_informations do |t|
      t.string :product_img
      t.string :product_name
      t.integer :num_customer_reviews
      t.string :product_dimensions
      t.string :asin

      t.timestamps
    end
  end
end
