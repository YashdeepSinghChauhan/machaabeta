class ReviewsController < ApplicationController
before_action :find_post
	def new
		
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.post_id = @post.id
		@review.user_id = current_user.id
	
		if @review.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	private

		def review_params
			params.require(:review).permit(:rating, comment)
		end

		def find_post
			@post = Post.find(params[:post_id])
		end
end



