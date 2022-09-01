class CommentsController < ApplicationController
  def edit
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end
    redirect_to micropost_path(params[:micropost_id])
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(micropost_id: params[:micropost_id])
  end
end
