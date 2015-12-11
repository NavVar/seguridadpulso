# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
others_company=[{name:'Otro', background:'-',location:'-',contact_reference:'-',nit:0}]

others_company.each do |other|
  Company.create( name: other[:name], background: other[:background], location: other[:location], contact_reference: other[:contact_reference], nit: other[:nit].to_i)
end
