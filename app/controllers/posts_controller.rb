class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy] 
	def index
		@post = Post.all.order("created_at DESC")
	end

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = @post = current_user.posts.build(post_params)
		
		if @post.save
			redirect_to @post, notic: "Successfully created a post"
		else
			render 'new'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end
private
 
	def post_params
		params.require(:post).permit(:title, :character, :description)
	end

	def find_post
		@post = Post.find(params[:id])

	end
end
