class Micropost < ApplicationRecord
  belongs_to :user
  scope :recent_posts, ->{order created_at: :desc}
  has_one_attached :image
  validates :user_id, presence: true
  validates :content, presence: true,
             length: {maximum: Settings.micropost.length_content}
  validates :image, content_type: {in: Settings.micropost.image_path,
                                   message: :wrong_format},
                    size: {less_than: Settings.micropost.less_than.megabytes,
                           message: :too_big}
  def display_image
    image.variant resize_to_limit: Settings.micropost.resize_to_limit
  end
end
