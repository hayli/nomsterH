class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @place    = Place.find(params[:place_id])
    @comment  = @place.comments.create(comment_params.merge(:user => current_user))

    if @comment.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end

    redirect_to place_path(@place)
 
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
