class Attendence < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :bar_id, :uniqueness => { :scope => [:user_id], :message => "already attending" }

  validates :restaurant_id, :uniqueness => { :scope => [:user_id], :message => "already attending" }

  validates :restaurant_id, :presence => true

  validates :user_id, :presence => true

end
