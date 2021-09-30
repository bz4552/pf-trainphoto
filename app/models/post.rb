class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_attachments_for :images, attachment: :image

  validates :title, presence: true
  validates :company, presence: true
  validates :series, presence: true
  validates :place, presence: true
  validates :car, presence: true
  validates :date, presence: true
  validates :line, presence: true


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
