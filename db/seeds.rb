require 'csv'

puts 'Cleaning category database...'
Profile.destroy_all
User.destroy_all

Variant.destroy_all
Product.destroy_all
Category.destroy_all

Composition.destroy_all
puts '... Cleaning -- OK'

category1 = Category.new(name: 'pot')
category2 = Category.new(name: 'plant')
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
details1 = { material: "plastic", color: "white" }
details2 = { id_code: "447840", id_sup: "446231", family: "Marantacae", gender: "Calathea", species: "crotalifera", cultivar: "", variant: "", description: "blabla", sun_exposure: "fort besoin", watering: "fort besoin" }

pot1.details = details1
plant2.details = details2

pot1.save!
plant2.save!

puts "Ajout de 2 produits -- OK"

variant_pot1 = Variant.new(sku: 1, diameter_cm: 10, height_format: "M")
variant_plant2 = Variant.new(sku: 2, diameter_cm: 20, height_format: "L")
variant_pot1.product = pot1
variant_plant2.product = plant2

variant_pot1.save!
variant_plant2.save!

puts "Ajout de 2 variantes -- OK"

match = variant_plant2.id.to_s + ";" + variant_pot1.id.to_s

compo1 = Composition.new(variants_match: match, photo_url: "https://images.unsplash.com/photo-1508975174-c000113b5900?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1667&q=80")
compo1.save!
puts "Ajout d'une composition -- OK"


Order.create!(profile_id: profile1.id, composition_id: compo1.id, status:"done",composition_nickname:"Fanny")
Order.create!(profile_id: profile2.id, composition_id: compo1.id, status:"done",composition_nickname:"Fanny")
Order.create!(profile_id: profile3.id, composition_id: compo1.id, status:"done",composition_nickname:"Fanny")


puts "Attribution d'une contribusion a chaque user --OK"


Taxref.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'TAXREFv12-extract.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Taxref.new
  t.id_code = row['CD_REF']
  t.id_sup = row['CD_SUP']
  t.rang_code = row['RANG']
  t.full_name = row['LB_NOM']
  t.family = row['FAMILLE']
  t.gender = row['LB_NOM'].split(" ")[0]
  t.species = row['LB_NOM'].split(" ")[1]
  t.cultivar = row['LB_NOM'].scan(/'.+'/)[0]
  t.variant = row['LB_NOM'].scan(/var\. (.*)/)[0]
  t.save!
end

Taxref.all.each do |line|
  if line.id_sup.nil?
    line.id_sup = Taxref.where(rang_code: "GN").where(gender: line.gender).first.id_code
    line.save!
  end
end

puts "There are now #{Taxref.count} rows in the taxref table"

puts 'Finished!'

