class PostsController < ApplicationController
  before_action :set_post, only: [:destroy, :edit, :update]
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
		@post.delete
		flash[:success] = "Your Blog has been deleted successfully."
		redirect_to @post
	end

	def new
		@post = Post.new(params[:post])
	end

	def edit
	end

	def update
		if @post.update(posts_params)
		  flash[:success] = 'Your Post is updated'
		  redirect_to @post
    else
      render 'edit'
    end
	end

	def show
		@post = Post.find_by_id(params[:id])
	  @comment = Comment.new
	  @comments = @post.comments
  end

	private
	def posts_params
		params.require(:post).permit(:content)
	end

  private
  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
