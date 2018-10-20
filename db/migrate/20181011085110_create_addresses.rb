class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :area,   null: false
      t.string :postal_code,   null: false
      t.string :city,   null: false
      t.string :address1,   null: false
      t.string :address2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
