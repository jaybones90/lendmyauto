require 'rails_helper'

describe ReservationInvoice do
  it { should belong_to :reservation }
end
