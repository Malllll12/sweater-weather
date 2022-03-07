class LocationFacade
  def self.get_location(location)
    data = LocationService.long_lat_coords(location)[:results][0][:locations][0]
      Location.new(data)
  end
end
