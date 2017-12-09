class Seed

  def create_features
    features_array = ["Pets Allowed", "Smoking Allowed", "All Wheel Drive", "GPS", "Ski Rack", "Bike Rack", "Bluetooth", "Audio Input", "Sunroof", "Snow Tires or Chains", "Rear Camera", "Navigation", "Heated Seats"]
    features_array.each do |feature|
      Feature.create!(:description => feature )
    end
    puts "created #{Feature.all.count} features"
  end

  def create_users_and_account_details
    20.times do |i|
      user =  User.create!(
        email: Faker::Internet.email,
        password: 1234567,
        password_confirmation: 1234567
      )
      account = user.account
      account.user_first_name = Faker::Name.first_name
      account.user_last_name = Faker::Name.last_name
      account.user_phone_number = Faker::PhoneNumber.phone_number
      account.user_birth_date = Faker::Date.between(90.years.ago, 18.years.ago)
      account.save!
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
    10.times do |i|
      FactoryBot.create(:location)
    end
    10.times do |i|
      FactoryBot.create(:location, :city => "San Diego")
    end
  end


  def create_vehicles
    images_array = ['app/assets/images/4runner.jpg', 'app/assets/images/forester1.jpg', 'app/assets/images/lexus.jpg']
    20.times do |i|
      image = images_array.sample
      vehicle = FactoryBot.create(
        :vehicle,
        :owner_account_id => (i + 1),
        :current_location_id => (i + 1)
      )
      vehicle.images.create!(
        avatar: File.new("#{image}")
      )
    end
    puts "created #{Vehicle.all.count} vehicles"
  end


end

seed = Seed.new
seed.create_features
seed.create_users_and_account_details
seed.create_categories
seed.create_locations
seed.create_vehicles
