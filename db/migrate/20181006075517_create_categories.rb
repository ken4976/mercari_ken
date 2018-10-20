class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :parent_category
      t.text :child_category
      t.text :grand_child_category
      t.timestamps
    end
  end
end
