# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'szelpe', password: 'petike', email: 'szelpe@gmail.com')
member = Member.create(name: 'Sandor Jozsef', email: 'jozsi@sanyi.hu', nick: 'Sanyi', positions: 'fomufni', is_senior: false, introduction: 'En vagyok Jozsi')
proj = Project.create(name: "Elso projekt", description: "Ez egy fantasztikus projekt lesz!")
proj.members << member
proj = Project.create(name: "Masodik projekt", description: "Ez egy fantasztikus projekt lesz!")
proj.members << member
proj = Project.create(name: "Harmadik projekt", description: "Ez egy fantasztikus projekt lesz!")
proj.members << member