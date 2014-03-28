namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@example.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    200.times do |n|
      LineItem.create!(product_id: rand(20)+1,
                   quantity: rand(5)+1,
                   cart_id: nil,
                   order_id: rand(50)+1)
    end
     50.times do |n|
        full_name = Faker::Name.name
        address = Faker::Address.street_address
        city = Faker::Address.city
        postal_code =Faker::Address.zip_code
        shipping_type = "Standard-Shipping"

        users_id = rand(100)+1
        user = User.find(users_id)
        order = user.orders.new(full_name: full_name,
                                address: address,
                                city: city,
                                postal_code: postal_code,
                                shipping_type: shipping_type)
        order.toggle(:has_paid)
        order.save
    end
  end

  desc "Create, Migrate, Seed, and Populate  the database"
  task refresh: :environment do
    Rake::Task['db:reset'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    Rake::Task['db:populate'].invoke
  end

end