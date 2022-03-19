class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :first_user, class_name: "User"
  belongs_to :second_user, class_name: "User"

  validates :first_user_id, uniqueness: { scope: :second_user_id }
end
