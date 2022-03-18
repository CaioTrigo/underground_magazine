# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "yaml"
# Insumo.destroy_all if Rails.env.development?
# Adubo.destroy_all if Rails.env.development?

case Rails.env
    when 'development'
      PHOTOS = ["https://picsum.photos/seed/picsum/200/300", "https://picsum.photos/200/300?grayscale"]

      Post.destroy_all
      puts "♻️ Destroyed all Posts"
      Chatroom.destroy_all
      puts "♻️ Destroyed all Chatrooms"
      Reply.destroy_all
      puts "♻️ Destroyed all Replys"
      User.destroy_all
      puts "♻️ Destroyed all Users"

      puts 'Creating users...'
      admin = User.new(
                nickname: "Admin",
                full_name: "Administrator",
                email: "test@test.com",
                password: "password"
            )
      admin.save!

      gabriel_img = URI.open("https://avatars.githubusercontent.com/u/33099210?v=4")
      gabriel = User.new(
        nickname: "gbs0",
        full_name: "Gabriel Schiavo",
        email: "gabriel@undergroudmagazine.com",
        password: "password"
      )
      gabriel.photo.attach(io: gabriel_img, filename: 'avatar_gabriel.jpg', content_type: 'image/jpg')
      gabriel.save!
      
      bernardo_img = URI.open("https://avatars.githubusercontent.com/u/97058256?v=4")
      bernarndo = User.new(
        nickname: "bernardo10",
        full_name: "Bernarndo Garbin",
        email: "bernarndo@undergroudmagazine.com",
        password: "password"
      )
      bernarndo.photo.attach(io: bernardo_img, filename: 'avatar_caio.jpg', content_type: 'image/jpg')
      bernarndo.save!

      caio_img = URI.open("https://avatars.githubusercontent.com/u/83619590?v=4")
      caio = User.new(
        nickname: "caio10",
        full_name: "Caio Trigo",
        email: "caio@undergroudmagazine.com",
        password: "password"
      )
      caio.photo.attach(io: caio_img, filename: 'avatar_caio.jpg', content_type: 'image/jpg')
      caio.save!
      
      marcio_img = URI.open("https://avatars.githubusercontent.com/u/96788095?v=4")
      marcio = User.new(
        nickname: "marcio10",
        full_name: "Marcio Ferreira",
        email: "marcio@undergroudmagazine.com",
        password: "password"
      )
      marcio.photo.attach(io: marcio_img, filename: 'avatar_caio.jpg', content_type: 'image/jpg')
      marcio.save!

      puts "✅ Done Creating Users!"

      puts 'Creating Posts...'

      # Creating 20 random Art Posts
      20.times do
        file = URI.open(PHOTOS.sample)
        post = Post.new(user_id: User.all.sample.id, description: "A random unilimited art description")
        post.photo.attach(io: file, filename: 'art_from_user#{self.user_id}.jpg', content_type: 'image/jpg')
        post.save!
      end
      puts "✅ Done Creating Posts!"

    when 'test'
    # test-specific seeds ...
    # (Consider having your tests set up the data they need
    # themselves instead of seeding it here!)

    when 'production'

end
