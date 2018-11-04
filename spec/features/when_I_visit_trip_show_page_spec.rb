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

  it 'I see a list of all trails for that trip' do
    # visit trip_path(@trip_1)
    visit "trips/#{@trip_1.id}"
    # binding.pry
    expect(page).to have_content("one")
    expect(page).to have_content("two")
    expect(page).to have_content("three")
    expect(page).to have_content("add1")
    expect(page).to have_content("add2")
    expect(page).to have_content("add3")
    expect(page).to have_content(5)
    expect(page).to have_content(2)
    expect(page).to have_content(3)
  end

  it 'I see the total lengths of the trip' do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content(10)
  end

  it 'I see the total lengths of the trip' do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content(10)
  end

  it 'I see the average length of the trip' do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content(3.33)
  end

  it 'I see the longest trail of the trip' do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content("#{@trail_1.name} is the longest trail in this trip")
  end

  it 'I see the shortest trail of the trip' do
    visit "trips/#{@trip_1.id}"

    expect(page).to have_content("#{@trail_2.name} is the shortest trail in this trip")
  end

  it 'I can click a link to the trail show page' do
    visit "trips/#{@trip_1.id}"
    click_on "#{@trail_2.name}"

    expect(current_path).to eq("/trails/#{@trail_2.id}")
  end

end
