require 'rails_helper'

describe Reservation do

  it "adds a renter to a reservation" do
    renter = User.new(first_name: "Jason", last_name: "Ainsworth", email: "Jasoncruze@gmail.com", phone_number: "4158103075",
                      age: 27)
    lender = User.new(first_name: "Billy", last_name: "Badass", email: "Billybadass@gmail.com", phone_number: "7777777777",
                      age: 44)
    reservation = Reservation.new()
    reservation.renter = renter
    reservation.lender = lender
    expect(reservation.lender.first_name).to eq("Billy")
  end

  it "adds a pickup location to a reservation" do
    address = Address.new(street: "757 Apple Street", city: "Portland", state: "OR", zip_code: 97218)
    reservation = Reservation.new()
    reservation.pickup_location = address
    expect(reservation.pickup_location.city).to eq("Portland")
  end

end
