class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :user, presence: true
  validates :title, presence: true, length: {maximum: Settings.post.title_size}
  validates :description, length: {maximum: Settings.post.title_size}
  validates :content, presence: true, length: {maximum: Settings.post.content_size}

  mount_uploader :picture, PictureUploader

  scope :feed_sort, ->{order created_at: :desc}
  scope :publish, ->{where is_published: true}
  scope :top_post, lambda {
    joins(:comments).select("COUNT(comments.id) AS comments_count, posts.*")
      .group("posts.id").order("comments_count DESC").limit(Settings.post.limit_post)
  }
end
