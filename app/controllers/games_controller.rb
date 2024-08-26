class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

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

  

  def comment_params
    params.require(:comment).permit(:content)
  end


  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private

  # app/controllers/games_controller.rb
def game_params
  params.require(:game).permit(:title, :description, :genre, :release_date, :image)
end


end
