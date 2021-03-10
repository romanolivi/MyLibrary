class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user 
    validates :stars, numericality: { less_than_or_equal_to: 5,  only_integer: true }
    validates :stars, numericality: { greater_than_or_equal_to: 1,  only_integer: true }
    scope :star_rating, ->(stars) {where("stars == ?", stars) }
    validates :content, length: { minimum: 20 }
    

    def book_name
        self.try(:book).try(:name)
    end

    def book_name=(name)
    book = Book.find_or_create_by(name: name) if !name.blank?
    self.book = book
    end

end
