# Admin account
user = User.new
user.name = "Aurelio Vinicius"
user.telephone = "99999-9999"
user.email = "suporte@cdd.com"
user.password = "aurelio"
user.password_confirmation = "aurelio"
admin = Admin.new
user.admin = admin
admin.save
restaurant = Restaurant.new
restaurant.name = "Funes Gastronomia"
restaurant.description = "Venha se deliciar com uma comida caseira fresquinha."
restaurant.telephone = "3333-3333"
restaurant.email = "funes@culinaria.com"
restaurant.address = "Rua 7 de Setembro"
restaurant.food_type = "Caseira"
manager = Manager.new
restaurant.manager = manager
manager.user = user
manager.save
user.restaurant = restaurant
restaurant.save
user.save

# User accounts
5.times do |i|
  user = User.new
  user.name = Faker::Name.name
  user.telephone = Faker::Number.number(9)
  user.email = "suporte#{i + 10}@cdd.com"
  user.password = "123456"
  user.password_confirmation = "123456"
  user.save
end
