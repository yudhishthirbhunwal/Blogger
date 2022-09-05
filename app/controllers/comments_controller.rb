class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  def edit
    authorize @comment
  end
  
  def create
    @comment = current_user.comments.build(comment_params)
    authorize @comment
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end
    redirect_to micropost_path(params[:micropost_id])
  end
  
  def update
    authorize @comment
    if @comment.update(comment_params)
      redirect_to micropost_path(params[:micropost_id])
    else
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end
  end
  
  def destroy
    authorize @comment
    @comment.destroy
    redirect_to @comment.micropost
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id).merge(micropost_id: params[:micropost_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
