class BackgroundFacade
  def self.get_photo(location)
    photo_data = BackgroundService.get_image(location)[:results][0]
    Background.new(photo_data)
  end
end
