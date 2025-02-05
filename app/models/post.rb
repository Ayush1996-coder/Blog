class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_rich_text :content
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 5000}
end
