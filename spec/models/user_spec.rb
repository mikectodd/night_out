require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:received_friend_requests) }

    it { should have_many(:sent_friend_requests) }

    it { should have_many(:reviews) }

    it { should have_many(:attendances) }

    end

    describe "InDirect Associations" do

    it { should have_many(:friends) }

    it { should have_many(:confirmed_restaurant) }

    it { should have_many(:confirmed_bar) }

    it { should have_many(:restaurant_with_friends) }

    it { should have_many(:bars_with_friends) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }
      
    end
end
