OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '542813182473001', 'cb10cb28d260acb56f7cd2c04f48343e', :scope => 'email,user_location', :display => 'popup'
end

