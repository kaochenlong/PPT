class Post < ApplicationRecord
  validates :title, presence: true
  validates :serial, uniqueness: true

  belongs_to :board
  belongs_to :user

  before_create :create_serial

  private
  def create_serial
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *0..9].sample(n).join
  end
end
