class ReviewsController < ApplicationController
    before_action :require_login 
    before_action :set_review
    skip_before_action :set_review, only: [:new, :create]

    def new 
        @review = Review.new
    end 

    def create
        @review = Review.create(review_params)

        if @review.save 
            redirect_to review_path(@review)
        else 
            redirect_to new_review_path 
        end

    end 

    def show 
    end 

    def edit 
    end 

    def updated 
        # @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review)
        else 
            redirect_to edit_review_path
        end

    end 

    def destroy 
        Review.find(params[:id]).destroy
        redirect_to '/'
        flash[:message] = "Review successfully deleted"
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
