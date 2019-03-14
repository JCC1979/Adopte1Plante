
  json.array! @plants.pluck("gender").uniq.each do |plantgender|
    json.textsearch plantgender
  end

json.array! @plants.each do |plant|
  fulltext = plant.gender.to_s + " " + plant.species.to_s + " " + plant.variant.to_s + " " + plant.cultivar.to_s
  json.textsearch fulltext
end