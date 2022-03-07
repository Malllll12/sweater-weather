class BackgroundService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com")
  end

  def self.get_image(city)
    response = conn.get("/search/photos?") do |req|
      req.params['client_id'] = "#{ENV['UNSPLASH_API_KEY']}"
      req.params['query'] = city
    end

    data = JSON.parse(response.body, symbolize_names: true)
  end
end
