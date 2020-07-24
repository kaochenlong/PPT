class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path, notice: "新增成功"
    else
      # redirect_to new_board_path, notice: "發生錯誤"
      render :new
    end
  end

  private
  # Strong Parameters
  def board_params
    params.require(:board).permit(:title, :intro)
  end
end