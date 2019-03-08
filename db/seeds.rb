require 'csv'

puts 'Cleaning category database...'
Order.destroy_all
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
pot2 = Product.new
pot3 = Product.new
pot1.category = category1
pot2.category = category1
pot3.category = category1

details1 = { name: "Plastic pot", material: "plastic", color: "gray" }
details2 = { name: "Natural pot", material: "terracotta", color: "red" }
details3 = { name: "Metal pot", material: "metalic", color: "gray" }

pot1.details = details1
pot2.details = details2
pot3.details = details3

plant2 = Product.new
plant2.category = category2

details4 = { id_code: "447840", id_sup: "446231", family: "Marantacae", gender: "Calathea", species: "crotalifera", cultivar: "", variant: "", description: "blabla", sun_exposure: "fort besoin", watering: "fort besoin" }
plant2.details = details4

pot1.save!
pot2.save!
pot3.save!

plant2.save!

puts "Ajout de 3 pots et 1 plante dans produc -- OK"

plant2_syno = Synonym.new
plant2_syno.commercial_name = "Plan Paon"
plant2_syno.product = plant2
plant2_syno.synonyms_list = ["jean", "morise"]
plant2_syno.save!

puts "Ajout des synonyme pour la plante -- OK"


# variant_pot1s = Variant.new(sku: "1", diameter_cm: 10, height_format: "S")
# variant_pot2s = Variant.new(sku: "2", diameter_cm: 10, height_format: "S")
# variant_pot3s = Variant.new(sku: "3", diameter_cm: 10, height_format: "S")

# variant_pot1m = Variant.new(sku: "4", diameter_cm: 15, height_format: "M")
# variant_pot2m = Variant.new(sku: "5", diameter_cm: 15, height_format: "M")
# variant_pot3m = Variant.new(sku: "6", diameter_cm: 15, height_format: "M")

# variant_pot1l = Variant.new(sku: "7", diameter_cm: 20, height_format: "L")
# variant_pot2l = Variant.new(sku: "8", diameter_cm: 20, height_format: "L")
# variant_pot3l = Variant.new(sku: "9", diameter_cm: 20, height_format: "L")

# variant_plant2s = Variant.new(sku: "10", diameter_cm: 20, height_format: "S")
# variant_plant2m = Variant.new(sku: "11", diameter_cm: 30, height_format: "M")
# variant_plant2l = Variant.new(sku: "12", diameter_cm: 40, height_format: "L")

# variant_pot1s.product = pot1
# variant_pot1m.product = pot1
# variant_pot1l.product = pot1

# variant_pot2s.product = pot2
# variant_pot2m.product = pot2
# variant_pot2l.product = pot2

# variant_pot3s.product = pot3
# variant_pot3m.product = pot3
# variant_pot3l.product = pot3

# variant_plant2s.product = plant2
# variant_plant2m.product = plant2
# variant_plant2l.product = plant2

# variant_pot1s.save!
# variant_pot1m.save!
# variant_pot1l.save!

# variant_pot2s.save!
# variant_pot2m.save!
# variant_pot2l.save!

# variant_pot3s.save!
# variant_pot3m.save!
# variant_pot3l.save!

# variant_plant2s.save!
# variant_plant2m.save!
# variant_plant2l.save!

# puts "Ajout des variantes S M L pour les pots et la plante -- OK"

# match1 = { pot: variant_pot1m.id.to_s }
# match2 = { pot: variant_pot2m.id.to_s }
# match3 = { pot: variant_pot3m.id.to_s }

# match4 = { plant: variant_plant2s.id.to_s }
# match5 = { plant: variant_plant2m.id.to_s }
# match6 = { plant: variant_plant2l.id.to_s }
# match7 = { plant: variant_plant2s.id.to_s, pot: variant_pot1s.id.to_s  }
# match8 = { plant: variant_plant2m.id.to_s, pot: variant_pot1m.id.to_s  }
# match9 = { plant: variant_plant2l.id.to_s, pot: variant_pot1l.id.to_s  }

# match10 = { plant: variant_plant2s.id.to_s, pot: variant_pot2s.id.to_s  }
# match11 = { plant: variant_plant2m.id.to_s, pot: variant_pot2m.id.to_s  }
# match12 = { plant: variant_plant2l.id.to_s, pot: variant_pot2l.id.to_s }

# match13 = { plant: variant_plant2s.id.to_s, pot: variant_pot3s.id.to_s }
# match14 = { plant: variant_plant2m.id.to_s, pot: variant_pot3m.id.to_s }
# match15 = { plant: variant_plant2l.id.to_s, pot: variant_pot3l.id.to_s  }


# compo1 = Composition.new(variants_match: match1, image_id: "/images/composition/pot1.jpg")
# compo2 = Composition.new(variants_match: match2, image_id: "/images/composition/pot2.jpg")
# compo3 = Composition.new(variants_match: match3, image_id: "/images/composition/pot3.jpg")

# compo4 = Composition.new(variants_match: match4, image_id: "/images/composition/planteS.jpg")
# compo5 = Composition.new(variants_match: match5, image_id: "/images/composition/planteM.jpg")
# compo6 = Composition.new(variants_match: match6, image_id: "/images/composition/planteL.jpg")

# compo7 = Composition.new(variants_match: match7, image_id: "/images/composition/planteSpot1.jpg")
# compo8 = Composition.new(variants_match: match8, image_id: "/images/composition/planteMpot1.jpg")
# compo9 = Composition.new(variants_match: match9, image_id: "/images/composition/planteLpot1.jpg")

# compo10 = Composition.new(variants_match: match10, image_id: "/images/composition/planteSpot2.jpg")
# compo11 = Composition.new(variants_match: match11, image_id: "/images/composition/planteMpot2.jpg")
# compo12 = Composition.new(variants_match: match12, image_id: "/images/composition/planteLpot2.jpg")

# compo13 = Composition.new(variants_match: match13, image_id: "/images/composition/planteSpot3.jpg")
# compo14 = Composition.new(variants_match: match14, image_id: "/images/composition/planteMpot3.jpg")
# compo15 = Composition.new(variants_match: match15, image_id: "/images/composition/planteLpot3.jpg")

# compo1.save!
# compo2.save!
# compo3.save!
# compo4.save!
# compo5.save!
# compo6.save!
# compo7.save!
# compo8.save!
# compo9.save!
# compo10.save!
# compo11.save!
# compo12.save!
# compo13.save!
# compo14.save!
# compo15.save!

# puts "Ajout des compositions -- OK"


# Order.create!(profile_id: profile1.id, composition_id: compo8.id, status:"done",composition_nickname:"Fanny")
# Order.create!(profile_id: profile2.id, composition_id: compo8.id, status:"done",composition_nickname:"Fanny")
# Order.create!(profile_id: profile3.id, composition_id: compo8.id, status:"done",composition_nickname:"Fanny")


# puts "Attribution d'une contribusion a chaque user --OK"


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

