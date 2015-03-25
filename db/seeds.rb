# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



20.times {

  name = Faker::Name.name
  email = Faker::Internet.email(name)
  phases = [1, 2, 3, 'coach', 'teacher']
  phase = phases[rand(phases.length)]
  password = Faker::Lorem.word

  user = User.create(
    :name=>name,
    :email=>email,
    :phase=>phase,
    :password=>password
  )

  rand(10).times {
    title = Faker::Lorem.sentence(rand(10))
    content = Faker::Lorem.paragraph(rand(10))
    user_id = user.id

    user.stickies << Sticky.create(
      :title=>title,
      :content=>content,
      :user_id=>user_id
    )

    user.save

    user.stickies.each { |stiqy|

      rand(10).times {
        title = Faker::Lorem.sentence(rand(10))

        content = Faker::Lorem.paragraph(rand(10))

        sticky_id = stiqy.id
        user_id = stiqy.user.id

        stiqy.helps << Help.create(
          :title => title,
          :content => content,
          :sticky_id => sticky_id,
          :user_id => user_id
        )
      }
      stiqy.save
    }
  }
}

