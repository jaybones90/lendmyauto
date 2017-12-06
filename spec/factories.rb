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

  factory(:vehicle) do
    make("Dummy")
    model("McDumb")
    year(2001)
    transmission("Manual")
    color("Black")
    milage(100900)
    seats(5)
    doors(4)
    daily_price(44.00)
    availability_start(Faker::Date.between(4.years.ago, 3.years.ago))
    availability_end(Faker::Date.between(2.years.ago, 1.years.ago))
  end



end
