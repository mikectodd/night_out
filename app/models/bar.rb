class Bar < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :attendees,
             :class_name => "Attendence",
             :dependent => :destroy

  # Indirect associations

  has_many   :friends_going,
             :through => :confirmed_guests,
             :source => :friends

  # Validations

end
