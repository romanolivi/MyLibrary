module BooksHelper
    def book_link(review)
        review.book.nil? ? link_to("Add Book", edit_song_path(song)) : link_to(review.book_name, book_path(review.book))
    end
end
