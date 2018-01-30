class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :rank
      t.string :category_type
      t.string :ladder

      t.timestamps
    end
  end
end
