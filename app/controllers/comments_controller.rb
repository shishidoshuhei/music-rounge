class CommentsController < ApplicationController
  def create
  	post = Post.find(params[:post.id])
  	comment = current_user.post.new(post_params)
  	comment.post_id = post.id
  	comment.save
  	redirect_to post.path(post.id)
  end

  def destroy
  end

  private
  def post_params
  	params.require(:post).require(:body)
  end
end
