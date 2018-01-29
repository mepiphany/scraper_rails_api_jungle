class AddReferencesToCategories < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :product_information, foreign_key: true, index: true
  end
end
