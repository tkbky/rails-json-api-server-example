class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: true

  with_options on: :update, if: -> { password.present? } do
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
  end

end
