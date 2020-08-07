class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = current_user.favorited_boards
  end
end