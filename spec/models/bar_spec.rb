require 'rails_helper'

RSpec.describe Bar, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reviews) }

    it { should have_many(:attendees) }

    end

    describe "InDirect Associations" do

    it { should have_many(:friends_going) }

    end

    describe "Validations" do
      
    end
end
