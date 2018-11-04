require 'rails_helper'

describe "As a vistitor when I go to trips index" do

  before(:each) do
    @trail_1 = Trail.create(name: "one",address: "add1",length: 5)
    @trail_2 = Trail.create(name: "two",address: "add2",length: 2)
    @trail_3 = Trail.create(name: "three",address: "add3",length: 3)
    @trail_4 = Trail.create(name: "four",address: "add4",length: 7)
    @trip_1 = Trip.create(name: "first")
    @trip_2 = Trip.create(name: "second")
    @trip_trail_1 = TrailTrip.create(trip: @trip_1, trail: @trail_1)
    @trip_trail_2 = TrailTrip.create(trip: @trip_1, trail: @trail_2)
    @trip_trail_3 = TrailTrip.create(trip: @trip_1, trail: @trail_3)
    @trip_trail_4 = TrailTrip.create(trip: @trip_2, trail: @trail_3)
    @trip_trail_5 = TrailTrip.create(trip: @trip_2, trail: @trail_4)
  end

  it 'I see a list of all trips' do
    visit "trips"

    expect(page).to have_content("first")
    expect(page).to have_content("second")
  end

  it 'I can click a link to trip show page' do
    visit "/trips"
    # save_and_open_page
    click_on "first"
    expect(page).to have_content("trip show")
  end

end
