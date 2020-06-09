class Like < ApplicationRecord
  belongs_to :post, class_name: 'Thredded::Post'
  belongs_to :user
end
