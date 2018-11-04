class Trail < ApplicationRecord

  has_many :trail_trips
  has_many :trips, through: :trail_trips

  validates_presence_of :name, :address, :length
  validates_numericality_of :length, only_integer: true, greater_than: 0

  def get_trips_ids
    TrailTrip.where(trail_id: 1).pluck(:trip_id)
  end

  def get_trips
    # Trip.where(id: get_trips_ids)
    Trip.joins(:trails).where("trails.id = #{self.id}")
  end

end
