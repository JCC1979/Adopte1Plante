puts 'Cleaning category database...'
Profile.destroy_all
User.destroy_all

Category.destroy_all
Product.destroy_all
Variant.destroy_all

Composition.destroy_all
puts '... Cleaning -- OK'


category1 = Category.new(name: 'pot')
category2 = Category.new(name: 'plante')
category1.save!
category2.save!
puts "Ajout category -- OK"

user1 = User.new(email: "jcc197959@hotmail.fr", password: "password")
profile1 = Profile.new(first_name: 'JC', 
last_name: 'Coevoet', 
address: '102 avenue de Bretagne', 
address_zipcode: 59_000, 
address_city: "Lille", 
address_country: "France")

user2 = User.new(email: "zpichetti@gmail.com", password: "password")
profile2 = Profile.new(first_name: 'Xavier',
last_name: 'Pichetti',
address: '7 avenue Hippolite Peslin',
address_zipcode: 59_000,
address_city: "Lille", 
address_country: "France")

user3 = User.new(email: "antoinepotdevin@gmail.com", password: "password")
profile3 = Profile.new(first_name: 'Antoine',
last_name: "Potdevin",
address: "25 avenue de Flandre",
address_zipcode: 75_018,
address_city: "Paris", 
address_country: "France")

profile1.user = user1
profile2.user = user2
profile3.user = user3

user1.save!
user2.save!
user3.save!

profile1.save!
profile2.save!
profile3.save!

puts "Ajout 3 profiles & users -- OK"

pot1 = Product.new
plant2 = Product.new
pot1.category = category1
plant2.category = category2
details1 = { material: "plastic" ,color: "white" } 
details2 = { taxref: 1234, family: "Marantacae", gender: "Calathea", species: "rubifolia", description: "blabla", sun_exposure: "fort besoin", watering: "fort besoin" }
pot1.details = details1
plant2.details = details2

pot1.save!
plant2.save!

puts "Ajout de 2 produits"

variant_pot1 = Variant.new(sku: 1, diameter_cm: 10, height_format: "M")
variant_plant2 = Variant.new(sku: 2, diameter_cm: 20, height_format: "L")
variant_pot1.product = pot1
variant_plant2.product = plant2

variant_pot1.save!
variant_plant2.save!

puts "Ajout de 2 variantes"

puts 'Finished!'

