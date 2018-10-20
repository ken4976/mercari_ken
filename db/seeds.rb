# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/category.csv') do |row|
  Category.create(:parent_category => row[0],
                  :child_category => row[1],
                  :grand_child_category => row[2])
end

CSV.foreach('db/area.csv') do |row|
  Area.create(:area => row[0])
end

CSV.foreach('db/size.csv') do |row|
  Size.create(:size => row[0])
end

CSV.foreach('db/brand.csv') do |row|
  Brand.create(:brand => row[0])
end
