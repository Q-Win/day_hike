class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @trails = @trip.get_trails
    if @trails == nil

    else
      @trip_length = @trip.get_length
      @ave_trail_length = @trip.get_average
      @longest_trail = @trip.get_longest_trail
      @shortest_trail = @trip.get_shortest_trail
    end
  end

end
