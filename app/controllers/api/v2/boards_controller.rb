class Api::V2::BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
end
