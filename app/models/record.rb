class Record < ApplicationRecord
  validates :title,:content, length: { in: 1..140 } 
end  
