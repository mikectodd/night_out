class Bar < ApplicationRecord
  # Direct associations

  has_many   :attendees,
             :class_name => "Attendence",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
