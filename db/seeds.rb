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
    
      gabriel = User.new(
        nickname: "gbs0",
        full_name: "Gabriel Schiavo",
        email: "gabriel@undergroudmagazine.com",
        password: "password"
      )
      gabriel.save!
      
      bernarndo = User.new(
        nickname: "bernardo10",
        full_name: "Bernarndo Garbin",
        email: "bernarndo@undergroudmagazine.com",
        password: "password"
      )
      bernarndo.save!

      caio = User.new(
        nickname: "caio10",
        full_name: "Caio Trigo",
        email: "caio@undergroudmagazine.com",
        password: "password"
      )
      caio.save!

      marcio = User.new(
        nickname: "marcio10",
        full_name: "Marcio Ferreira",
        email: "marcio@undergroudmagazine.com",
        password: "password"
      )
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
