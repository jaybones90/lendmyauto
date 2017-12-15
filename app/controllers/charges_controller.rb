class ChargesController < ApplicationController
  before_action :get_reservation, only: :create

  def new
    @reservation = Reservation.find(params[:reservation_id])
    @amount = @reservation.total_price
  end

  def create
    customer = StripePayment.create_customer(
      email: params[:stripeEmail],
      stripe_token: params[:stripeToken])

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

end
