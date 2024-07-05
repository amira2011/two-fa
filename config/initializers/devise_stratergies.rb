Warden::Strategies.add(:password_authenticatable) do
  def valid?
    params['user'] && params['user']['email'] && params['user']['password']
  end
  def authenticate!
    resource = User.where(email: params['user']['email']).first
    if resource && resource.valid_password?(params['user']['password'])
      success!(resource)
    else
      fail!('Invalid email or password')
    end
  end
end