require 'pry'
class User < ApplicationRecord
    has_many :reviews 
    has_many :books, through: :reviews
    has_secure_password
    validates :username, presence: true, message: "Must type in username"
    validates :username, uniqueness: true, message: "Username already taken"

    def genre_count
        self.books.genre.count 
    end


    
end
