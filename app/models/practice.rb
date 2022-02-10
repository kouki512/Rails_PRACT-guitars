class Practice < ApplicationRecord
  belongs_to :user
  has_many :practice_images,dependent: :destroy
  enum textbook:{tab: 0, youtube: 1, book: 2, school: 3, other: 4}
  accepts_attachments_for :practice_images, attachment: :tab_image
  validates :title, presence: true
end
