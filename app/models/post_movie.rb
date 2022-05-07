class PostMovie < ApplicationRecord
belongs_to :user
validates :youtube_url, presence: true
validates :title, presence: true

end
