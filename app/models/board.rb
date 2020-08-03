class Board < ApplicationRecord
  acts_as_paranoid

  has_many :posts

  has_many :board_masters
  has_many :users, through: :board_masters

  validates :title, presence: true, length: { minimum: 2 }
end
