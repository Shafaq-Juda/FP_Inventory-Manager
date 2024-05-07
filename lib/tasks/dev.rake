
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
      "dev:add_products",
      "dev:add_vendors"
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
    # Unable to add products when running sample data task on my machine
    task add_products: :environment do
      users = User.all
      puts "adding products"
      10.times do
        product = Product.create(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph(sentence_count: 3),
          image: Faker::Avatar.image(slug: "my-own-slug", size: "300x300", format: "png"),
          price: Faker::Commerce.price(range: 0..100.0, as_string: false),
          quantity: Faker::Number.between(from: 1, to: 100),
          barcode: Faker::Barcode.ean,
          owner_id: users.sample.id,
          vendor_name: Faker::Company.name
        )

        # Assign a random vendor to the product
        product.update(vendor_id: Vendor.pluck(:id).sample)

        # Assuming the owner is the currently logged in user or a default user
        product.update(owner: users.sample)

      end
      puts "Added #{Product.count} products to the database!"

    end


    task add_vendors: :environment do
      puts "adding vendors"
      Product.all.each do |p|
        5.times do
          Vendor.create(
            name: Faker::Company.name,
            contact_info: Faker::Company.unique.catch_phrase,
          )
        end
      end
      puts "Added #{Vendor.count} vendors to the database!"
    end
  end
end
