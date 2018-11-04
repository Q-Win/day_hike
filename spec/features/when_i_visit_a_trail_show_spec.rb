require 'rails_helper'

describe "As a vistitor when I go to trails show" do

  before(:each) do
    @trail_1 = Trail.create(name: "trail 1",address: "add1",length: 5)
    @trail_2 = Trail.create(name: "trail 2",address: "add2",length: 2)
    @trail_3 = Trail.create(name: "trail 3",address: "add3",length: 3)
    @trail_4 = Trail.create(name: "trail 4",address: "add4",length: 7)
    @trip_1 = Trip.create(name: "first trip")
    @trip_2 = Trip.create(name: "second trip")
    @trip_3 = Trip.create(name: "third trip")
    @trip_trail_1 = TrailTrip.create(trip: @trip_1, trail: @trail_1)
    @trip_trail_2 = TrailTrip.create(trip: @trip_1, trail: @trail_2)
    @trip_trail_3 = TrailTrip.create(trip: @trip_1, trail: @trail_3)
    @trip_trail_4 = TrailTrip.create(trip: @trip_2, trail: @trail_3)
    @trip_trail_5 = TrailTrip.create(trip: @trip_2, trail: @trail_4)
    @trip_trail_6 = TrailTrip.create(trip: @trip_3, trail: @trail_1)
    @trip_trail_7 = TrailTrip.create(trip: @trip_3, trail: @trail_4)
  end

  it 'I see a list of all trips that contain that trail' do

    visit "trails/#{@trail_1.id}"
    expect(page).to have_content("trail 1")
    expect(page).to have_content("add1")
    expect(page).to have_content("first")
    expect(page).to have_content("third")
    expect(page).to have_content(10)
    expect(page).to have_content(12)
    expect(page).to have_content("Number of trips with this trail 2")
  end



end
