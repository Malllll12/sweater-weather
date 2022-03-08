class BackgroundSerializer
  def self.image_json(image)
    {
      data: {
        type: "image",
        id: "null",
        attributes: {
          image: {
            location: image.location,
            description: image.description,
            image_url: image.image_url,
            site: image.site,
            credit: {
                photographer: image.photographer,
                photographer_site: image.photographer_site
            }
          }
        }
      }
    }
  end
end
