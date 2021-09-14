class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :image

  validates :title, presence: true
  validates :company, presence: true
  validates :series, presence: true
  validates :line, presence: true
  validates :car, presence: true
  validates :place, presence: true
	validates :body, presence: true, length: { maximum: 200}
	validates :date, presence: true
	validates :images, presence: true

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
