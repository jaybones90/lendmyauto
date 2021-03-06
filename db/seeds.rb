class Seed

  def create_features
    features_array = ["Pets Allowed", "Smoking Allowed", "All Wheel Drive", "GPS", "Ski Rack", "Bike Rack", "Bluetooth", "Audio Input", "Sunroof", "Snow Tires or Chains", "Rear Camera", "Navigation", "Heated Seats"]
    features_array.each do |feature|
      Feature.create!(:description => feature )
    end
    puts "created #{Feature.all.count} features"
  end

  def create_users_and_account_details
    50.times do |i|
      user =  User.create!(
        email: Faker::Internet.email,
        password: 1234567,
        password_confirmation: 1234567
      )
      account = user.account
      account.user_first_name = Faker::Name.first_name
      account.user_last_name = Faker::Name.last_name
      account.user_phone_number = "4158103075"
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
    25.times do |i|
      FactoryBot.create(:location)
    end
    25.times do |i|
      FactoryBot.create(:location, :city => "San Diego")
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
    50.times do |i|
      image = images_array.sample
      vehicle = Vehicle.create!(
        make: makes.sample,
        model: models.sample,
        year: random.rand(1998..2018),
        milage: random.rand(0..120000),
        color: Faker::Color.color_name,
        cylinders: random.rand(2..12),
        drive_type: 'Front Wheel Drive',
        fuel_type: "Gasoline",
        highway_mpg: 20,
        transmission: transmissions.sample,
        seats: seats.sample,
        doors: doors.sample,
        category_id: random.rand(1..10),
        daily_price: Faker::Commerce.price,
        availability_start: Date.today,
        availability_end: Date.today + 30.days,
        owner_account_id: (i + 1),
        current_location_id: (i + 1),
      )
      8.times do |i|
        vehicle.features << Feature.find(rand(1..13))
      end
      4.times do |i|
        vehicle.images.create!(
          avatar: File.new("#{image}")
        )
      end
    end
    puts "created #{Vehicle.all.count} vehicles"
  end


  def create_reservations
    15.times do |i|
      Reservation.create(
        lender_account_id: (i + 1),
        renter_account_id: (i + 16),
        vehicle_id: (i + 1),
        location_id: (i + 1),
        start_date: Faker::Date.between(Date.today, Date.today + 5.days),
        end_date: Faker::Date.between(Date.today + 10.days, Date.today + 15.days)
      )
    end
    15.times do |i|
      Reservation.create(
        lender_account_id: (i + 16),
        renter_account_id: (i + 1),
        vehicle_id: (i + 16),
        location_id: (i + 16),
        start_date: Faker::Date.between(Date.today + 15.days, Date.today + 20.days),
        end_date: Faker::Date.between(Date.today + 25.days, Date.today + 30.days)
      )
    end
  end


end

seed = Seed.new
seed.create_features
seed.create_users_and_account_details
seed.create_categories
seed.create_locations
seed.create_vehicles
seed.create_reservations
