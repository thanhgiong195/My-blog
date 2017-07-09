class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
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
      .group("posts.id").order("comments_count DESC").limit Settings.post.limit_post
  }
  scope :search, ->(search){where "title LIKE ?", "%#{search}%"}
  scope :load_feed, ->(id, following_ids) do
    where "user_id IN (#{following_ids}) OR user_id = :user_id",
      following_ids: following_ids, user_id: id
  end

  def all_tags=names
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end
end
