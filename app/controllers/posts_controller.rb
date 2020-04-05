class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]

	def index
		@posts = Post.all
	end

	def create
		  @post = current_user.posts.build(posts_params)
		  if @post.save
			  flash.now[:success] = "Your blog has been created and posted to your profile page....."
			  redirect_to @post
		  else
			  render 'new'
			end
	end

	def destroy
		@post = current_user.posts.find(params[:id])
		@post.delete
		flash[:success] = "Your Blog has been deleted successfully."
		redirect_to @post
	end

	def new
		@post = Post.new(params[:post])
	end

	def show
		  @post = current_user.posts.find_by_id(params[:id])
		  @posts = current_user.posts
	  end

	private
	def posts_params
		params.require(:post).permit(:content)
	end
end
