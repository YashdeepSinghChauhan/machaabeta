class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit] 
	
	def search
		if params[:search].present?
			@posts = Post.search(params[:search])
		else
			@posts = Post.all
		end
	end

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
		if @post.reviews.blank?
			@average_review = 0
		else
			@average_review = @post.reviews.average(:rating).round(2)
		end
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		
		if @post.save
			redirect_to @post, notic: "Successfully created a post"
		else
			render 'new'
		end
	end
	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post was successfully updated"
		else
			render 'edit'
		end
		
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end
private
 
	def post_params
		params.require(:post).permit(:title, :character, :description, :image)
	end

	def find_post
		@post = Post.find(params[:id])

	end
end
