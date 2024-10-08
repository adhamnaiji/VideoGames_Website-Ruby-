class GamesController < ApplicationController
 
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @comment = @game.comments.build # For the comment form
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.build(game_params) # Automatically set the user_id
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render 'new'
    end
  end
  
  

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render 'edit'
    end
  end
  

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice: 'Game was successfully deleted.'
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :genre, :release_date, :price, :image)
  end


  private

  def check_admin
    unless current_user.admin?
      redirect_to games_path, alert: "You are not authorized to perform this action."
    end
  end
  
end
