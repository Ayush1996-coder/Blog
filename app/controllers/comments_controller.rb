class CommentsController < ApplicationController
  before_action :set_post_id_for_comments, only: [:create, :destroy]
  
	def create
		@comment = @post.comments.create(comments_params)
		if @comment.save
      redirect_to @post
    else
      redirect_to post_path(@post)
    end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	private
	def comments_params
		params.require(:comment).permit(:name, :body)
	end

  private
  def set_post_id_for_comments
    @post = Post.find(params[:post_id])
  end
end
