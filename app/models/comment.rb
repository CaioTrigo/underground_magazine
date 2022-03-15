class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies

  validates :text, presence: true
end
