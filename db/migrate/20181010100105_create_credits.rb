class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.references :user,      foreign_key: true, null: false
      t.string :num,           unique: true, null: false
      t.string :expire_month,  null: false
      t.string :expire_year,   null: false
      t.string :security_code, null: false
      t.timestamps
    end
  end
end
