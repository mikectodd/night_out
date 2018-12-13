require 'rails_helper'

RSpec.describe Review, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:restaurant) }

    it { should belong_to(:visitor) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:bar_id) }

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:restaurant_id) }

    it { should validate_presence_of(:reviewer_id) }
      
    end
end
