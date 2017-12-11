date_formats = {
  month_day_comma_year: "%B %e, %Y" 
}

Time::DATE_FORMATS.merge! date_formats
Date::DATE_FORMATS.merge! date_formats
