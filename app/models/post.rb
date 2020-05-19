class Post < ApplicationRecord
  validates :location, presence: true
  belongs_to :user
  has_many :kuchikomis

  def self.search(search)
    if search
      Post.where('name LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
