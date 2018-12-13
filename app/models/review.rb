class Review < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :bar_id, :uniqueness => true

  validates :body, :presence => true

  validates :restaurant_id, :presence => true

  validates :reviewer_id, :presence => true

end
