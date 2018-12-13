require 'rails_helper'

RSpec.describe Bar, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reviews) }

    it { should have_many(:attendees) }

    end

    describe "InDirect Associations" do

    it { should have_many(:confirmed_guests) }

    it { should have_many(:friends_attending_bar) }

    end

    describe "Validations" do
      
    end
end
