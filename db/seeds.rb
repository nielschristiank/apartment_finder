# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Apartment.create(address_1: '123 Fake St.', address_2: '#272', city: 'San Diego', postal_code: '92101', state: 'CA', country: 'USA', building_manager_name: 'Bob', building_manager_phone: 15556782345, building_manager_hours: 'Mon-Fri: 8AM-5PM')

Apartment.create(address_1: '456 Someplace St.', address_2: '#62', city: 'San Diego', postal_code: '92101', state: 'CA', country: 'USA', building_manager_name: 'Bob', building_manager_phone: 15556782345, building_manager_hours: 'Tue-Fri: 9AM-6PM')
