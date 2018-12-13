class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :attendees,
             :class_name => "Attendence",
             :dependent => :destroy

  # Indirect associations

  has_many   :confirmed_guest,
             :through => :attendees,
             :source => :user

  has_many   :friends_going,
             :through => :confirmed_guest,
             :source => :friends

  # Validations

  validates :image, :presence => true

end
