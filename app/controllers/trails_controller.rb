class TrailsController < ApplicationController

  def index

  end

  def show
    @trail = Trail.find(params[:id])
    @trips = @trail.get_trips
  end

end
