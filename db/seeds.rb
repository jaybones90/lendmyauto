class Seed

  def create_features
    features_array = ["Pets Allowed", "Smoking Allowed", "All Wheel Drive", "GPS", "Ski Rack", "Bike Rack", "Bluetooth", "Audio Input", "Sunroof", "Snow Tires or Chains", "Rear Camera", "Navigation", "Heated Seats"]
    features_array.each do |feature|
      Feature.create!(:description => feature )
    end
    puts "created #{Feature.all.count} features"
  end

  def create_users
    5.times do |i|
      User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        age: Faker::Number.number(2),
        phone_number: Faker::PhoneNumber.phone_number,
        password: 1234567,
        password_confirmation: 1234567
      )
    end
    puts "created #{User.all.count} users"
  end

  def create_account_addresses
    5.times do |i|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip_code: Faker::Address.zip_code,
        account_id: (i + 1)
      )
      puts "created #{Address.all.count} account addresses"
    end
  end

  def create_vehicles
    transmissions = ["Automatic", "Manual"]
    random = Random.new()
    doors = [2,4]
    seats = [2,4,5,6,7,8]
    makes = ["Audi", "BMW", "Chevy", "Toyota", "Subaru"]
    models = ["Accord", "Dakota", "Forester", "A4", "Suburban"]
    categories = ["Suv","Truck", "Sedan", "Coupe", "Van", "Wagon", "Convertible","Sports Car", "Hybrid/Electric",  "Luxury"]
    5.times do |i|
      Vehicle.create!(
        make: makes.sample,
        model: models.sample,
        year: random.rand(1998..2018),
        milage: random.rand(0..120000),
        color: Faker::Color.color_name,
        transmission: transmissions.sample,
        seats: seats.sample,
        doors: doors.sample,
        category: categories.sample,
        daily_price: Faker::Commerce.price,
        account_id: (i + 1),
        availability_start: Date.civil(2017, 12, random.rand(30)),
        availability_end: Date.civil(2018, random.rand(12), random.rand(30))
      )
    end
    puts "created #{Vehicle.all.count} vehicles"
  end


end

seed = Seed.new
seed.create_features
seed.create_users
seed.create_account_addresses
seed.create_vehicles
