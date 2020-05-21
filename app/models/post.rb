class Post < ApplicationRecord
  validates :name, :location, presence: true
  belongs_to :user
  has_many :kuchikomis


  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where('name LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
