class Review < ApplicationRecord
  # Direct associations

  belongs_to :bar,
             :required => false,
             :counter_cache => true

  belongs_to :restaurant,
             :required => false,
             :counter_cache => true

  belongs_to :visitor,
             :class_name => "User",
             :foreign_key => "reviewer_id"

  # Indirect associations

  # Validations

  validates :bar_id, :uniqueness => true

  validates :body, :presence => true

  validates :restaurant_id, :presence => true

  validates :reviewer_id, :presence => true

end
