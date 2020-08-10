class Post < ApplicationRecord
  validates :title, presence: true
  validates :serial, uniqueness: true

  belongs_to :board
  belongs_to :user
  has_many :comments

  before_create :create_serial

  def display_username
    if user.nil?
      "-"
    else
      user.account
    end
  end

  private
  def create_serial
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    [*'a'..'z', *'A'..'Z', *0..9].sample(n).join
  end
end
