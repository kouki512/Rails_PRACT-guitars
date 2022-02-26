class PracticeImage < ApplicationRecord
  belongs_to :practice
  attachment :tab_image
end
