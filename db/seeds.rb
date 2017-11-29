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
        account_id: i
      )
      puts "created #{Address.all.count} account addresses"
    end
  end

  def create_vehicles
    5.times do |i|
      Vehicle.create!()
    end
  end


end

seed = Seed.new
seed.create_features
seed.create_users
seed.create_account_addresses
