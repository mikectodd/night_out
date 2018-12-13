class Attendence < ApplicationRecord
  # Direct associations

  belongs_to :bar,
             :required => false,
             :counter_cache => :attendees_count

  belongs_to :restaurant,
             :required => false,
             :counter_cache => :attendees_count

  belongs_to :user,
             :counter_cache => :attendances_count

  # Indirect associations

  # Validations

  validates :bar_id, :uniqueness => { :scope => [:user_id], :message => "already attending" }

  validates :restaurant_id, :uniqueness => { :scope => [:user_id], :message => "already attending" }

  validates :restaurant_id, :presence => true

  validates :user_id, :presence => true

end
