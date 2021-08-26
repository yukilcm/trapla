class Schedule < ApplicationRecord
  belongs_to :travel

  def within_travel_period?
    start_at >= travel.start_date.to_time &&
      start_at <= travel.end_date.to_time.end_of_day &&
      end_at >= travel.start_date.to_time &&
      end_at <= travel.end_date.to_time.end_of_day
  end
end
