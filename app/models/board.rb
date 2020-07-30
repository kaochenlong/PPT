class Board < ApplicationRecord
  acts_as_paranoid

  validates :title, presence: true, length: { minimum: 2 }
end
