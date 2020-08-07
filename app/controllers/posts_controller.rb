class PostsController < ApplicationController
  before_action :find_board, only: [:new, :create]
  before_action :authenticate_user!, except: [:show]

  def show
    @post = Post.find(params[:id])
  end

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

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: '文章更新成功'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post)
          .permit(:title, :content)
          .merge(user: current_user)
  end

  def find_board
    @board = Board.find(params[:board_id])
  end
end