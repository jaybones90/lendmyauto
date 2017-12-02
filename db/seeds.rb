class Seed

  def create_features
    features_array = ["Pets Allowed", "Smoking Allowed", "All Wheel Drive", "GPS", "Ski Rack", "Bike Rack", "Bluetooth", "Audio Input", "Sunroof", "Snow Tires or Chains", "Rear Camera", "Navigation", "Heated Seats"]
    features_array.each do |feature|
      Feature.create!(:description => feature )
    end
    puts "created #{Feature.all.count} features"
  end

  def create_users_and_account_details
    5.times do |i|
      user =  User.create!(
        email: Faker::Internet.email,
        password: 1234567,
        password_confirmation: 1234567
      )
      account = user.account
      account.user_first_name = Faker::Name.first_name
      account.user_last_name = Faker::Name.last_name
      account.user_phone_number = Faker::PhoneNumber.phone_number
      account.user_birth_date = Faker::Date.between(90.years.ago, 10.years.ago)
    end
  puts "created #{User.all.count} users"
  end

  def create_categories
    categories = ["Suv","Truck", "Sedan", "Coupe", "Van", "Wagon", "Convertible","Sports Car", "Hybrid/Electric",  "Luxury"]
    categories.each do |category|
      Category.create!(
        :name => category
      )
    end
  end

  def create_locations
    5.times do |i|
      Location.create!(
        street_address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip_code: Faker::Address.zip_code,
        country: Faker::Address.country
      )
    end
  end


  def create_vehicles
    transmissions = ["Automatic", "Manual"]
    images_array = ['app/assets/images/4runner.jpg', 'app/assets/images/forester1.jpg', 'app/assets/images/lexus.jpg']
    random = Random.new()
    doors = [2,4]
    seats = [2,4,5,6,7,8]
    makes = ["Audi", "BMW", "Chevy", "Toyota", "Subaru"]
    models = ["Accord", "Dakota", "Forester", "A4", "Suburban"]
    categories = ["Suv","Truck", "Sedan", "Coupe", "Van", "Wagon", "Convertible","Sports Car", "Hybrid/Electric",  "Luxury"]
    5.times do |i|
      image = images_array.sample
      vehicle = Vehicle.create!(
        make: makes.sample,
        model: models.sample,
        year: random.rand(1998..2018),
        milage: random.rand(0..120000),
        color: Faker::Color.color_name,
        transmission: transmissions.sample,
        seats: seats.sample,
        doors: doors.sample,
        category_id: random.rand(1..10),
        daily_price: Faker::Commerce.price,
        owner_account_id: (i + 1),
        current_location_id: random.rand(1..5)
      )
      2.times do |i|
        vehicle.images.create!(
          avatar: File.new("#{image}")
        )
      end
    end
    puts "created #{Vehicle.all.count} vehicles"
  end


end

seed = Seed.new
seed.create_features
seed.create_users_and_account_details
seed.create_account_addresses
seed.create_vehicles
