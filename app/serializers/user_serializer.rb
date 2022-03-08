class UserSerializer
  def self.serialize(user)
    {
      data: {
        id: user.id.to_s,
        type: "users",
        attributes: {
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end
end
