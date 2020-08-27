class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).reverse_order
    @search = @posts.ransack(params[:q])
    if params[:q].present?
      @posts = @search.result
      # Tag.find(PostTag.find_by(post_id: 54).tag_id).name  post_idからposttagsを検索して、そこから関連づいているtagのnameを取得している。
    end
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save!
      unless params[:post][:tags].present?
        redirect_to posts_path
      end
      params[:post][:tags].each do |tag|
        post_tag = PostTag.new
        post_tag.post_id = post.id
        post_tag.tag_id = tag.to_i
        if post_tag.save!
        end
      end
      redirect_to posts_path
    end
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    @tag = @post.tags
  end

  def new
    @post = Post.new
    @tags = Tag.all
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
      params.require(:post).permit(:title, :body, tags: [])
    end
end