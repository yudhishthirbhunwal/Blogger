class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
    # redirect_to micropost_path(:micropost_id)
    redirect_to @like.micropost
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    micropost = @like.micropost
    @like.destroy
    redirect_to micropost
  end

  private
    def like_params
      params.require(:like).permit(:micropost_id)
    end
end
