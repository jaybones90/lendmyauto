class Search
  include ActiveModel::Model
  include ActiveModelAttributes

  attribute :city, :string
  attribute :date_start, :date
  attribute :date_end, :datetime, default: -> { 7.days.from_now }

  validate :city_exists?

  private

  def city_exists?
    unless Location.exists?(['city ILIKE ?', city])
      errors.add(:city, "We are not currently active in #{city}")
    end
  end




end