class CreateTaxrefs < ActiveRecord::Migration[5.2]
  def change
    create_table :taxrefs do |t|
      t.string :id_code   # reference unique 
      t.string :id_sup    # reference du point supérieur
      t.string :rang_code # peut etre GN: gender ES: species CAR: cultivar VAR:variante
      t.string :full_name
      t.string :family    # Ex: Asparagaceae
      t.string :gender    # Ex: Sansevieria
      t.string :species   # Ex: trifasciata / Sansevieria trifasciata 'Laurentii'
      t.string :cultivar  # Ex: 'Laurentii' / Sansevieria trifasciata 'Laurentii'
      t.string :variant   # Ex: trifasciata / Sansevieria trifasciata var. trifasciata
      t.timestamps
    end
  end
end
