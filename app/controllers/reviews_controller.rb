class ReviewsController < ApplicationController
    before_action :require_login 
    before_action :set_review
    skip_before_action :set_review, only: [:new, :create, :destroy]

    def index 
        if params[:user_id]
            if User.where(id: params[:user_id]).present?
                @reviews = User.find(params[:user_id]).reviews 
            else 
                flash[:alert] = "Artist not found."
                redirect_to books_path
            end
        else
            @reviews = Review.all 
        end
    end

    def show 
        if params[:book_id]
            if Review.where(id: params[:id]).present?
                @review = Review.find(params[:id])
            else 
                @book = Book.find(params[:book_id])
                flash[:alert] = "Review doesn't exist"
                redirect_to book_reviews_path(@book)
            end
        else 
            @review = Review.find(params[:id])
        end
    end

    def new 
        if params[:book_id] && !Book.exists?(params[:book_id])
            redirect_to books_path, alert: "Book doesn't exist"
        else 
            @review = Review.new(book_id: params[:book_id])
        end
    end 

    def create
        @review = Review.create(review_params)

        if @review.save 
            redirect_to review_path(@review)
        else 
            raise params inspect
            redirect_to new_review_path 
        end

    end  

    def edit 
        
    end 

    def update
        # @review = Review.find_by(id: params[:id])
        @review.update(review_params)

        if @review.save
            redirect_to review_path(@review)
        else 
            redirect_to edit_review_path(@review)
        end

    end 

    def destroy 
        @review = Review.find(params[:id])
        @user = @review.user 
        @review.destroy 
        flash[:notice] = "Review successfully deleted"
        redirect_to user_path(@user)
    end 


    private 

    def review_params 
        params.require(:review).permit(:content, :stars, :user_id, :book_id)
    end

    def require_login 
        redirect_to '/' unless session.include? :user_id
    end

    def set_review
        @review = Review.find_by(id: params[:id])
    end

end
