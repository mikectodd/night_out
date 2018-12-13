require 'open-uri'
class Bar < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :attendees,
             :class_name => "Attendence",
             :dependent => :destroy

  # Indirect associations

  has_many   :confirmed_guests,
             :through => :attendees,
             :source => :user

  has_many   :friends_going,
             :through => :confirmed_guests,
             :source => :friends

  # Validations

end
