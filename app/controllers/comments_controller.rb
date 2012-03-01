class CommentsController < ApplicationController
  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.build(params[:comment])
   @comment.user = current_user

   @comment.save
    respond_to do |format|
     format.html { redirect_to @post, notice: 'Post was successfully created.' }
     format.js	
    end
  end

  def destroy
  end

end
