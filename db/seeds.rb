# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Meal.destroy_all
DeliveryOrder.destroy_all

10.times do
  Meal.create(
    name: Faker::Food.unique.dish,
    description:
Faker::BackToTheFuture.unique.quote
  )
end

5.times do |i|
    DeliveryOrder.create(
      order_id: "GO"+(i+1).to_s.rjust(3,'0'),
      serving_datetime: Faker::Time.between(DateTime.now - 1, DateTime.now)
    )
end

OrderItem.create(delivery_order_id: 1, meal_id: 1, quantity: 3, unit_price: 700)
OrderItem.create(delivery_order_id: 1, meal_id: 1, quantity: 1, unit_price: 360)
OrderItem.create(delivery_order_id: 1, meal_id: 2, quantity: 2, unit_price: 849)
OrderItem.create(delivery_order_id: 2, meal_id: 2, quantity: 5, unit_price: 605)
OrderItem.create(delivery_order_id: 2, meal_id: 3, quantity: 1, unit_price: 500)
OrderItem.create(delivery_order_id: 3, meal_id: 3, quantity: 3, unit_price: 500)
OrderItem.create(delivery_order_id: 4, meal_id: 3, quantity: 1, unit_price: 628)
OrderItem.create(delivery_order_id: 4, meal_id: 6, quantity: 2, unit_price: 450)
OrderItem.create(delivery_order_id: 5, meal_id: 8, quantity: 1, unit_price: 500)
OrderItem.create(delivery_order_id: 5, meal_id: 9, quantity: 1, unit_price: 800)
