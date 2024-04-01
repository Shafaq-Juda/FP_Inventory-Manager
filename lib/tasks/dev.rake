unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ]

    desc "Adds sample data for development environment"
    task sample_data: [
      :environment,
      "dev:add_users",
      "dev:add_posts",
      "dev:add_comments"
    ] do
      puts "done adding sample data"
    end

    task add_users: :environment do
      puts "adding users..."
      names = ["alice", "bob", "carol"]

      names.each do |name|
        u = User.create(
          email: "#{name}@example.com",
          username: name,
          password: "password"
        )
        puts "added #{u.email}"
      end

      puts "done"
    end

    task add_products: :environment do
      puts "adding products"
      25.times do |i|
        p = Product.create(
          user_id: User.all.sample.id,
          name: Faker::Commerce.product_name, 
          description: Faker::Lorem.paragraph(sentence_count: 3
          image_url: Faker::LoremPixel.image(size: "300x300", is_gray: false, category: 'abstract'),
          price: Faker::Commerce.price(as_string: true),
          quantity: Faker::Number.between(from: 1, to: 1000),
          barcode: Faker::Barcode.ean,
          vendor_id: Faker::Number.between(from: 1, to: 5)
        )
      end
      puts "done"
    end

    task add_vendors: :environment do
      puts "adding vendors"
      Product.all.each do |p|
        rand(5).times do |i|
          v = Vendor.create(
            user_id: User.all.sample.id,
            name: Faker::Company.name,
            contact_info: Faker::Company.unique.catch_phrase
          )
        end
      end
      puts "done"
    end
  end
end
