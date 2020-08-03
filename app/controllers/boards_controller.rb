class BoardsController < ApplicationController

  before_action :find_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    if user_signed_in?
      @board = Board.new
    else
      redirect_to root_path, notice: '請先登入會員'
    end
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: "刪除成功"
  end

  private
  def find_board
    @board = Board.find(params[:id])
  end

  # Strong Parameters
  def board_params
    params.require(:board).permit(:title, :intro)
  end
end