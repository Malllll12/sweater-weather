class LocationFacade
  def self.get_location(location)
    data = LocationService.long_lat_coords(location)[:results][0][:locations][0]
      Location.new(data)
  end

  def self.get_trip(origin, destination)
    eta = LocationService.get_directions(origin, destination)[:route][:formattedTime]
  end
end
