class Practice < ApplicationRecord
  belongs_to :user
  enum textbook:{tab: 0, youtube: 1, book: 2, school: 3, other: 4}

  

end
