# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(
    :name => "admin",
    :email => "jonas@nanodex.com",
    :password => "JonasP2",
    :password_confirmation => "JonasP2"
)
admin.toggle!(:admin)

ferrofluid = Material.create!(name: 'Ferrofluid')
fullerene = Material.create!(name: 'Fullerene')
graphene = Material.create!(name: 'Graphene')
grapheneoxide = Material.create!(name: 'Graphene Oxide')
liposome = Material.create!(name: 'Liposome')
nanometal = Material.create!(name: 'Nanometal')
metamaterial = Material.create!(name: 'Metamaterial')
micelle = Material.create!(name: 'Micelle')
nanoclay = Material.create!(name: 'Nanoclay')
nanocomposite = Material.create!(name: 'Nanocomposite')
nanodiamond = Material.create!(name: 'Nanodiamond')
nanofiber = Material.create!(name: 'Nanofiber')
nanomagnet = Material.create!(name: 'Nanomagnet')
nanoparticle = Material.create!(name: 'Nanoparticle')
nanorod = Material.create!(name: 'Nanorod')
nanosheet = Material.create!(name: 'Nanosheet')
nanotube = Material.create!(name: 'Nanotube')
nanowire = Material.create!(name: 'Nanowire')
semiconductor = Material.create!(name: 'Semiconductor')
quantumdot = Material.create!(name: 'Quantum Dot')
