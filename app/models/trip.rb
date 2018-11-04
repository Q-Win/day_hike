class Trip < ApplicationRecord

  has_many :trail_trips
  has_many :trails, through: :trail_trips

  def get_trails
    Trail.joins(:trips).where("trips.id = #{self.id}")
  end

  def get_length
    get_trails.sum(:length)
  end

  def get_average
    get_trails.average(:length).to_f.round(2)
  end

  def get_longest_trail
    get_trails.order(:length).last
  end

  def get_shortest_trail
    get_trails.order(:length).first
  end
end
