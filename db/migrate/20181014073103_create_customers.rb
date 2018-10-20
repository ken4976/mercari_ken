class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true, null: false
      t.text :token,    null: false
      t.timestamps
    end
  end
end
