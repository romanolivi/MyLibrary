class BooksController < ApplicationController
    before_action :set_book
    skip_before_action :set_book, only: [:new, :create, :index]

    def index 
        @books = Book.all 
    end

    def new 
        @book = Book.new
    end

    def create 
        @book = Book.create(book_params)

        if @book.save 
            redirect_to book_path(@book)
        else 
            redirect_to new_book_path
        end
    end

    def show
    end

    def edit 
    end 

    def update 
        # @book = Book.find_by(id: params[:id])
        @book.update(book_params)

        if @book
            redirect_to book_path(@book)
        else 
            redirect_to edit_book_path(@book)
        end
    end

    def destroy 
        Book.find(params[:id]).destroy 
        redirect_to '/'
    end

    private 
     
    def set_book 
        @book = Book.find_by(id: params[:id])
    end

    def book_params
        params.require(:book).permit(:name, :genre, :author, :page_count)
    end 

end
