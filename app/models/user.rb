class User < ApplicationRecord
  # Direct associations

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :reviews,
             :foreign_key => "reviewer_id",
             :dependent => :destroy

  has_many   :attendances,
             :class_name => "Attendence",
             :dependent => :destroy

  # Indirect associations

  has_many   :friends,
             :through => :received_friend_requests,
             :source => :sender

  has_many   :friends,
             :through => :sent_friend_requests,
             :source => :recipient

  has_many   :confirmed_restaurant,
             :through => :attendances,
             :source => :restaurant

  has_many   :confirmed_bar,
             :through => :attendances,
             :source => :bar

  has_many   :restaurant_with_friends,
             :through => :friends,
             :source => :confirmed_restaurant

  has_many   :bars_with_friends,
             :through => :friends,
             :source => :confirmed_bar

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
