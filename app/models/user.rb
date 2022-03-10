class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, length: { minimum: 1 }
    validates :login, presence: true, uniqueness: { message: 'already exists'}, length: { minimum: 3 }
    validates :password, presence: true, length: { minimum: 3 }, :confirmation => true
    validates :password_confirmation, :presence => true
end
