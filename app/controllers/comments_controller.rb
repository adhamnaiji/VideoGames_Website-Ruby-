class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @game, notice: 'Comment was successfully created.'
    else
      redirect_to @game, alert: 'There was an error adding your comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
