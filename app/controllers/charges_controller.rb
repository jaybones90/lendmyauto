class ChargesController < ApplicationController
  before_action :get_reservation, only: :create
  before_action :authenticate_user!

  def new
    reservation = Reservation.find(params[:reservation_id])
    @vehicle = reservation.vehicle
    @amount = reservation.total_price
    @description = format_description(reservation)
  end

  def create
    customer = StripePayment.create_customer(
      email: params[:stripeEmail],
      stripe_token: params[:stripeToken]
    )

    charge = StripePayment.create_charge(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def get_reservation
    reservation = Reservation.find(session[:current_reservation_id])
    @amount = reservation.total_price
  end

  def format_description(reservation)
    starting = reservation.start_date.to_date
    ending = reservation.end_date.to_date
    "Reservation for #{starting} to #{ending}"
  end

end
