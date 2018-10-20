class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.text :brand
      t.timestamps
    end
  end
end
