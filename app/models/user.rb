class User < ApplicationRecord
    validates :name, presence: true, length: { minimum: 1 }
    validates :login, presence: true, length: { minimum: 3 }
    validates :password, presence: true, length: { minimum: 3 }, :confirmation => true
    validates :password_confirmation, :presence => true
end
