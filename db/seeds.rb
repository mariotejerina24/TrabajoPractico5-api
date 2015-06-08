# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
Product.create(title: 'Yerba',
  price: '50')

Product.create(title: 'Mesa',
  price: '400')


Product.create(title: 'Silla',
  price: '80')

Product.create(title: 'Celular',
  price: '1500')
Product.create(title: 'Galletitas',
  price: '15')
Product.create(title: 'Ejemplo1',
  price: '15')
Product.create(title: 'Ejemplo2',
  price: '15')
