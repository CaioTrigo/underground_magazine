require 'pry'

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :photo

  validates :description, presence: true
  validates :photo, presence: true

  after_create :set_author_name

  private
  
  def set_author_name
    user = User.find(self.user_id)
    update_attribute(:author, user.full_name)
  end
end
