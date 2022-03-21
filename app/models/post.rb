class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :photo

  has_one_attached :avatar

  validates :description, presence: true
  validates :photo, presence: true

  after_create :set_author_name

  scope :from_certain_user, -> (user_id) { where("user_id = ?", user_id) }

  private

  def set_author_name
    user = User.find(self.user_id)
    update_attribute(:author, user.full_name)
  end
end
