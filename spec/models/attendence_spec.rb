require 'rails_helper'

RSpec.describe Attendence, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:bar) }

    it { should belong_to(:restaurant) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:bar_id).scoped_to(:user_id).with_message('already attending') }

    it { should validate_uniqueness_of(:restaurant_id).scoped_to(:user_id).with_message('already attending') }

    it { should validate_presence_of(:restaurant_id) }

    it { should validate_presence_of(:user_id) }
      
    end
end
