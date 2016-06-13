class BasicAuth

  def initialize(user, password)
    @user = user
    @password = password
  end

  def call
    if @user.authenticate(@password)
      @user.errors.add(:auth_token, I18n.t('errors.messages.invalid')) unless @user.update(auth_token: SecureRandom.base64(64))
    else
      @user.errors.add(:password, I18n.t('errors.messages.invalid'))
    end
    @user
  end

end
