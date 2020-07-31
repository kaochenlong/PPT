class PostsController < ApplicationController
  before_action :find_board, only: [:new, :create]

  def new
    @post = @board.posts.new
  end

  def create
    @post = @board.posts.new(post_params)

    if @post.save
      redirect_to @board, notice: '文章新增成功'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_board
    @board = Board.find(params[:board_id])
  end
end