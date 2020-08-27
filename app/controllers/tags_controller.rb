class TagsController < ApplicationController

	def show
	  @tag = Tag.find(params[:id])
	  # tagを起点にそのタグに関連づいているpostを探している
	  @tag_posts = @tag.posts
	end
end
