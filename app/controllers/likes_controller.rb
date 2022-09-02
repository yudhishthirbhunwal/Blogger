class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: microposts_path)
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    likeable = @like.likeable
    @like.destroy
    redirect_back(fallback_location: microposts_path)
  end

  private
    def like_params
      params.require(:like).permit(:likeable_id, :likeable_type)
    end
end
