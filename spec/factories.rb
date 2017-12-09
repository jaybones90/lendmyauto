FactoryBot.define do

  factory(:user) do
    email("testemail@gmail.com")
    password("1234567")
    password_confirmation("1234567")
  end

  factory(:account) do
    user_first_name("Dummy")
    user_last_name("McDumb")
    user_birth_date(Faker::Date.between(90.years.ago, 10.years.ago))
    user_phone_number("4158103075")
  end

  factory(:location) do
    street_address(Faker::Address.street_address)
    city("Portland")
    state("OR")
    zip_code(Faker::Address.zip)
    country("US")
  end


  factory(:reservation) do
    start_date(Faker::Date.between(Date.today + 10.days, Date.today + 20.days))
    end_date(Faker::Date.between(Date.today + 20.days, Date.today + 30.days))
  end


  transmissions = ["Automatic", "Manual"]
  images_array = ['app/assets/images/4runner.jpg', 'app/assets/images/forester1.jpg', 'app/assets/images/lexus.jpg']
  random = Random.new()
  doors = [2,4]
  seats = [2,4,5,6,7,8]
  makes = ["Audi", "BMW", "Chevy", "Toyota", "Subaru"]
  models = ["Accord", "Dakota", "Forester", "A4", "Suburban"]

  factory(:vehicle) do
    make(makes.sample)
    model(models.sample)
    year(random.rand(1998..2018))
    transmission(transmissions.sample)
    color(Faker::Color.color_name)
    milage(random.rand(0..120000))
    seats(seats.sample)
    doors(doors.sample)
    daily_price(Faker::Commerce.price)
    category_id(random.rand(1..10))
    availability_start(Date.today)
    availability_end(Date.today + 30.days)
    factory(:available_vehicles) do
      availability_start(Date.today)
      availability_end(Date.today + 10.days)
    end
  end




end
