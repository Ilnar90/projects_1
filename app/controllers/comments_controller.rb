class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create!(params[:comment])
    respond_to do |format|
      format.html { redirect_to @micropost }
      format.js
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to(@comment.post, :notice => 'Comment was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(post_path(@comment.post))
  end
end