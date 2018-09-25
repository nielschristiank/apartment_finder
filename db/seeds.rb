# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
batman = User.create(first_name: "Bruce", last_name: "Wayne", email: "bat@man.com", password: "batcave")
theflash = User.create(first_name: "Wally", last_name: "West", email: "fastest@manalive.com", password: "theflash")
wonderWoman = User.create(first_name: "Diane", last_name: "Prince", email: "wonder@woman.com", password: "doperope")

Apartment.delete_all
Apartment.create(user_id: batman.id, address_1: '123 Fake St.', address_2: '#272', city: 'San Diego', postal_code: '92101', state: 'CA', country: 'USA', building_manager_name: 'Bob', building_manager_phone: "5556782345", building_manager_hours: 'Mon-Fri: 8AM-5PM')
Apartment.create(user_id: theflash.id, address_1: '456 Someplace St.', address_2: '#62', city: 'Townville', postal_code: '89098', state: 'PA', country: 'USA', building_manager_name: 'Bob', building_manager_phone: "5556782345", building_manager_hours: 'Tue-Thu: 9AM-6PM')
Apartment.create(user_id: wonderWoman.id, address_1: '600 Awesmoe Ave.', address_2: '#62', city: 'San Franciso', postal_code: '73653', state: 'CA', country: 'USA', building_manager_name: 'Bob', building_manager_phone: "5556782345", building_manager_hours: 'Tue-Fri: 9AM-6PM')
Apartment.create(user_id: batman.id, address_1: '780 Dark Blvd.', address_2: '#62', city: 'San Diego', postal_code: '90031', state: 'CA', country: 'USA', building_manager_name: 'Bob', building_manager_phone: "5556782345", building_manager_hours: 'Mon-SUN: 10PM-12AM')
