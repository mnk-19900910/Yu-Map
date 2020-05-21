class Post < ApplicationRecord
  validates :location, presence: true
  belongs_to :user
  has_many :kuchikomis
  has_many :post_tags
  has_many :tags, through: :post_tags

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where('name LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
