class User < ApplicationRecord
    has_many :reviews 
    has_many :books, through: :reviews
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true

    def genre_count
        self.books.genre.count 
    end


    
end
