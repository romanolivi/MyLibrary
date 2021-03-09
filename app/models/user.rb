class User < ApplicationRecord
    has_many :reviews 
    has_many :books, through: :reviews
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :username, presence: true
    validates :username, uniqueness: true

  
    def self.find_or_create_by_omniauth(auth)
        self.where(:email => auth['info']['email']).first_or_create do |user|
            user.password = SecureRandom.hex 
        end
    end


    
end
