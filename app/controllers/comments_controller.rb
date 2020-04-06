class CommentsController < ApplicationController
  before_action :authenticate_user!
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comments_params)
		if @comment.save
      redirect_to @post
    else
      redirect_to post_path(@post)
    end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	private
	def comments_params
		params.require(:comment).permit(:name, :body)
	end
end
