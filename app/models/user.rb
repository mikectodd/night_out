class User < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :foreign_key => "reviewer_id",
             :dependent => :destroy

  has_many   :attendances,
             :class_name => "Attendence",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
