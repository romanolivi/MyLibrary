class User < ApplicationRecord
    has_many :reviews 
    has_many :books, through: :reviews
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :username, presence: true
    validates :username, uniqueness: true

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |a|
            a.password = SecureRandom.hex 
        end
    end


    def genre_count
        self.books.genre.count 
    end


    
end
