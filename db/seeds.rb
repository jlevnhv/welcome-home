# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.create(username: 'default', password: 'passw0rd', first_name: 'Default', last_name: 'User', email: 'default@user.com', role: 'user')
User.create(username: 'admin', password: 'P@ssw0rd1', first_name: 'Admin', last_name: 'User', email: 'admin@user.com', role: 'admin')
