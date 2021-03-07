class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user 
    validates :stars, numericality: { less_than_or_equal_to: 5,  only_integer: true }
    validates :stars, numericality: { greater_than_or_equal_to: 1,  only_integer: true }
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
