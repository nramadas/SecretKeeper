# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new(name: 'bill1', email: 'bill1@email.com')
u1.password = '1'
u1.save!

u2 = User.new(name: 'bill2', email: 'bill2@email.com')
u2.password = '2'
u2.save!

u3 = User.new(name: 'bill3', email: 'bill3@email.com')
u3.password = '3'
u3.save!

s1 = Secret.create!(title: 'i eat mud', body: 'lots of mud', user_id: 1)
s2 = Secret.create!(title: 'i eat worms', body: 'lots of worms', user_id: 2)
s3 = Secret.create!(title: 'i eat chalk', body: 'lots of chalk', user_id: 3)