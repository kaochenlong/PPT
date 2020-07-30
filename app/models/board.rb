class Board < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }

  def destroy
    update(deleted_at: Time.now)
  end

  # def self.all
  #   where(deleted_at: nil)
  # end
end
