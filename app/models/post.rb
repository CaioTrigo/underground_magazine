class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :photo

  validates :description, presence: true
  validates :photo, presence: true
end
