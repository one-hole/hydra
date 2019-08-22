# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "root", phone: '11111111111', password: '111111', password_confirmation: '111111')

t = Tenant.create
t.bc_orders.create(amount: 100)
t.bc_orders.create(amount: 190)
t.bc_orders.create(amount: 1000)
t.bc_orders.create(amount: 100.10)
t.bc_orders.create(amount: 100.01)
t.bc_orders.create(amount: 0.99)
