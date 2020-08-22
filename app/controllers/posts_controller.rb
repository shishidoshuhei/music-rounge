class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
  	redirect_to posts_path
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(patams[:id])
    post.update(post.params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "本当に削除しますか？"
    redirect_to user_path(current_user.id)
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end