class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user 
    scope :star_rating, ->(rating) {where("stars> ?", rating) }
    
   
    def book_name
        self.try(:book).try(:name)
    end

    def book_name=(name)
    book = Book.find_or_create_by(name: name) if !name.blank?
    self.book = book
    end

    def user_username
        self.try(:user).try(:username)
    end

    def user_username=(username)
    artist = Artist.find_or_create_by(username: username) if !username.blank?
    self.user = user
    end

end
