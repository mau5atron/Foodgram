class PostsController < ApplicationController
	# before_action :set_post!, only: [:show, :edit, :update, :destroy]

	# Add a before_filter to any controller that you want to secure.
	# This will force user's to login before they can see the actions in this controller
	before_action :authorize
	before_action :current_user, only: [:new, :create]

	def index
		@posts = Post.all
	end

	def new
		@post = @current_user.posts.new

	end
	def create
		@post = @current_user.posts.create(post_params)
		redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
		# refers to specific post we are looking at
	end

	def update
		# This action will be updating things in our database
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to(posts_path(@post))

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path

	end

	private 
	def post_params
		params.require(:post).permit(:image, :caption)
		
	end

end
