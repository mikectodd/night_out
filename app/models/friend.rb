class Friend < ApplicationRecord
  # Direct associations

  has_many   :attendences,
             :dependent => :destroy

  belongs_to :user,
             :foreign_key => "friend_id",
             :counter_cache => true

  # Indirect associations

  has_one    :restaurant_attended_by_friend,
             :through => :user,
             :source => :confirmed_restaurant

  has_one    :bar_attended_by_friend,
             :through => :user,
             :source => :confirmed_bar

  # Validations

  validates :friend_id, :uniqueness => { :message => "You are already friends with this person" }

  validates :friend_id, :presence => true

end
