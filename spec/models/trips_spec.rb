require 'rails_helper'

describe Trip, type: :model do
  describe 'Relationships' do
    it { should have_many(:trail_trips) }
    it { should have_many(:trails).through(:trail_trips) }
  end
end
