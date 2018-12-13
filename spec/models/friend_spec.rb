require 'rails_helper'

RSpec.describe Friend, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:attendences) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_one(:restaurant_attended_by_friend) }

    it { should have_one(:bar_attended_by_friend) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:friend_id).with_message('You are already friends with this person') }

    it { should validate_presence_of(:friend_id) }
      
    end
end
