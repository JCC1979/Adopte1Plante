require 'csv'

puts 'Cleaning category database...'
Order.destroy_all
Profile.destroy_all
User.destroy_all
VariantPlant.destroy_all
VariantPot.destroy_all
Plant.destroy_all
Pot.destroy_all
Composition.destroy_all
Taxref.destroy_all
puts '... Cleaning -- OK'

user1 = User.new(email: "jcc197959@hotmail.fr", password: "password", admin: true)
profile1 = Profile.new(first_name: 'JC',
  last_name: 'Coevoet',
  address: '102 avenue de Bretagne',
  address_zipcode: 59_000,
  address_city: "Lille",
  address_country: "France")

user2 = User.new(email: "zpichetti@gmail.com", password: "password", admin: true)
profile2 = Profile.new(first_name: 'Xavier',
  last_name: 'Pichetti',
  address: '7 avenue Hippolite Peslin',
  address_zipcode: 59_000,
  address_city: "Lille",
  address_country: "France")

user3 = User.new(email: "antoinepotdevin@gmail.com", password: "password", admin: true)
profile3 = Profile.new(first_name: 'Antoine',
  last_name: "Potdevin",
  address: "25 avenue de Flandre",
  address_zipcode: 75_018,
  address_city: "Paris",
  address_country: "France")

user_not_admin = User.new(email: "nonadmin@gmail.com", password: "password", admin: false)
profile_not_admin = Profile.new(first_name: 'User',
  last_name: "Lambda",
  address: "25 avenue de Flandre",
  address_zipcode: 75_018,
  address_city: "Paris",
  address_country: "France")

profile1.user = user1
profile2.user = user2
profile3.user = user3
profile_not_admin.user = user_not_admin

user1.save!
user2.save!
user3.save!
user_not_admin.save!

profile1.save!
profile2.save!
profile3.save!
profile_not_admin.user.save!

puts "Ajout 3 profiles & users admin & 1 profil non admin -- OK"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'TAXREFv12-extract.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
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
  t.commercial_name = row['NOM_VERN']
  t.save!
end

Taxref.all.each do |line|
  if line.id_sup.nil?
    line.id_sup = Taxref.where(rang_code: "GN").where(gender: line.gender).first.id_code
    line.save!
  end
end
puts "taxref table : #{Taxref.count} new rows"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'plants.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  t = Plant.new
  t.id_code = row['id_code']
  t.id_sup = row['id_sup']
  t.family = row['family']
  t.gender = row['gender']
  t.species = row['species']
  t.variant = row['variant']
  t.cultivar = row['cultivar']
  t.description = row['description']
  t.sun_exposure = row['sun_exposure']
  t.watering = row['watering']
  t.commercial_name = row['wcommercial_name']
  t.synonyms_list = row['synonyms_list']
  t.easy_seed_matching = row['easy_seed_matching']
  t.save!
end
puts "plants table : #{Plant.count} new rows"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pots.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  t = Pot.new
  t.name = row['name'].to_s
  t.material = row['material']
  t.color = row['color']
  t.easy_seed_matching = row['easy_seed_matching']
  t.save!
end
puts "pots table : #{Pot.count} new rows"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'variants_plant.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  var = VariantPlant.new
  var.sku = row['sku']
  match_index = row['sku'].split(/(\w*)-/)[1]
  var.diameter_cm = row['diameter_cm']
  var.height_format = row['height_format']
  var.price = row['price']
  Plant.all.each do |p|
    var.plant = p if p.easy_seed_matching == match_index
  end
  var.save!
end
puts "variant_plants table :  #{VariantPlant.count} new rows"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'variants_pot.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  var = VariantPot.new
  var.sku = row['sku']
  match_index = row['sku'].split(/(\w*)-/)[1]
  #  ou .chop.chop.split(/(\w*)-/)
  var.diameter_cm= row['diameter_cm']
  var.height_format = row['height_format']
  var.price = row['price']
  Pot.all.each do |p|
    var.pot = p if p.easy_seed_matching == match_index
  end
  var.save!
end
puts "variant_pots table : #{VariantPot.count} new rows"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'compositions.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  comp = Composition.new
  comp.variant_plant_sku = row['variant_plant_sku']
  comp.variant_pot_sku = row['variant_pot_sku']
  comp.remote_photo_url = row['image_url']
  comp.save!
end
puts "compositions table :  #{Composition.count} new rows"

puts 'Finished!'

