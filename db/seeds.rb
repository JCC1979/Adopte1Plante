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

pot1 = Pot.create!(name: "Plastic pot", material: "plastic", color: "gray")
pot2 = Pot.create!(name: "Natural pot", material: "terracotta", color: "red")
pot3 = Pot.create!(name: "Metal pot", material: "metalic", color: "gray")
plant2 = Plant.create!(id_code: "447840", id_sup: "446231", family: "Marantaceae",
  gender: "Calathea", species: "crotalifera", cultivar: "",
  variant: "", description: "blabla", sun_exposure: "fort besoin",
  watering: "fort besoin", commercial_name: "Plan Paon", synonyms_list: "jean, morise")
plant3 = Plant.create!(id_code: "334435", id_sup: "446231", family: "Asparagaceae",
  gender: "Sansevieria", species: "altissima", cultivar: "",
  variant: "", description: "blabla", sun_exposure: "fort besoin",
  watering: "fort besoin", commercial_name: "", synonyms_list: "jean, morise")

puts "Ajout de 3 pots et 2 planteq dans produc -- OK"

varpot1s = VariantPot.new(sku: "pot1-S", diameter_cm: 10, height_format: "S", price: 10)
varpot2s = VariantPot.new(sku: "pot2-S", diameter_cm: 10, height_format: "S", price: 12)
varpot3s = VariantPot.new(sku: "pot3-S", diameter_cm: 10, height_format: "S", price: 14)

varpot1m = VariantPot.new(sku: "pot1-M", diameter_cm: 10, height_format: "M", price: 19)
varpot2m = VariantPot.new(sku: "pot2-M", diameter_cm: 10, height_format: "M", price: 22)
varpot3m = VariantPot.new(sku: "pot3-M", diameter_cm: 10, height_format: "M", price: 14)

varpot1l = VariantPot.new(sku: "pot1-L", diameter_cm: 30, height_format: "L", price: 32)
varpot2l = VariantPot.new(sku: "pot2-L", diameter_cm: 30, height_format: "L", price: 35)
varpot3l = VariantPot.new(sku: "pot3-L", diameter_cm: 30, height_format: "L", price: 40)

varplant2s = VariantPlant.new(sku: 10, diameter_cm: 20, height_format: "S", price: 30)
varplant2m = VariantPlant.new(sku: 11, diameter_cm: 30, height_format: "M", price: 45)
varplant2l = VariantPlant.new(sku: 12, diameter_cm: 40, height_format: "L", price: 60)

varpot1s.pot = pot1
varpot1m.pot = pot1
varpot1l.pot = pot1
varpot2s.pot = pot2
varpot2m.pot = pot2
varpot2l.pot = pot2
varpot3s.pot = pot3
varpot3m.pot = pot3
varpot3l.pot = pot3
varplant2s.plant = plant2
varplant2m.plant = plant2
varplant2l.plant = plant2

varpot1s.save!
varpot1m.save!
varpot1l.save!
varpot2s.save!
varpot2m.save!
varpot2l.save!
varpot3s.save!
varpot3m.save!
varpot3l.save!
varplant2s.save!
varplant2m.save!
varplant2l.save!

puts "Ajout des variantes S M L pour 3 pots et 1 plante -- OK"

compo1 = Composition.new(variant_pot_sku: varpot1m.sku, image_id: "/images/composition/pot1.jpg")
compo2 = Composition.new(variant_pot_sku: varpot2m.sku, image_id: "/images/composition/pot2.jpg")
compo3 = Composition.new(variant_pot_sku: varpot3m.sku, image_id: "/images/composition/pot3.jpg")

compo4 = Composition.new(variant_plant_sku: varplant2s.sku, image_id: "/images/composition/planteS.jpg")
compo5 = Composition.new(variant_plant_sku: varplant2m.sku, image_id: "/images/composition/planteM.jpg")
compo6 = Composition.new(variant_plant_sku: varplant2l.sku, image_id: "/images/composition/planteL.jpg")

compo7 = Composition.new(variant_plant_sku: varplant2s.sku, variant_pot_sku: varpot1s.sku, image_id: "/images/composition/planteSpot1.jpg")
compo8 = Composition.new(variant_plant_sku: varplant2m.sku, variant_pot_sku: varpot1m.sku, image_id: "/images/composition/planteMpot1.jpg")
compo9 = Composition.new(variant_plant_sku: varplant2l.sku, variant_pot_sku: varpot1l.sku, image_id: "/images/composition/planteLpot1.jpg")

compo10 = Composition.new(variant_plant_sku: varplant2s.sku, variant_pot_sku: varpot2s.sku, image_id: "/images/composition/planteSpot2.jpg")
compo11 = Composition.new(variant_plant_sku: varplant2m.sku, variant_pot_sku: varpot2m.sku, image_id: "/images/composition/planteMpot2.jpg")
compo12 = Composition.new(variant_plant_sku: varplant2l.sku, variant_pot_sku: varpot2l.sku, image_id: "/images/composition/planteLpot2.jpg")

compo13 = Composition.new(variant_plant_sku: varplant2s.sku, variant_pot_sku: varpot3s.sku, image_id: "/images/composition/planteSpot3.jpg")
compo14 = Composition.new(variant_plant_sku: varplant2m.sku, variant_pot_sku: varpot3m.sku, image_id: "/images/composition/planteMpot3.jpg")
compo15 = Composition.new(variant_plant_sku: varplant2l.sku, variant_pot_sku: varpot3l.sku, image_id: "/images/composition/planteLpot3.jpg")


compo1.save!
compo2.save!
compo3.save!
compo4.save!
compo5.save!
compo6.save!
compo7.save!
compo8.save!
compo9.save!
compo10.save!
compo11.save!
compo12.save!
compo13.save!
compo14.save!
compo15.save!

puts "Ajout des compositions -- OK"


# Order.create!(profile_id: profile1.id, composition_id: compo8.id, status: "done", composition_nickname: "Fanny")
# Order.create!(profile_id: profile2.id, composition_id: compo8.id, status: "done", composition_nickname: "Fanny")
# Order.create!(profile_id: profile3.id, composition_id: compo8.id, status: "done", composition_nickname: "Fanny")

# puts "Attribution d'une contribusion a chaque user --OK"

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
  t.commercial_name = row['NOM_VERN']
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

