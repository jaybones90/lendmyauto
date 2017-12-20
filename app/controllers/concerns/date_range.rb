module DateRange
  extend ActiveSupport::Concern

  private

  def parse_start_date(range)
    if range != nil || range != ""
      split_dates = range.split(' - ')
      start_date = Date.strptime(split_dates[0], '%m/%d/%Y')
    end
    start_date
  end

  def parse_end_date(range)
    if range != nil || range != ""
      split_dates = range.split(' - ')
      end_date = Date.strptime(split_dates[1], '%m/%d/%Y')
    end
    end_date
  end

end
