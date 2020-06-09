class Like < ApplicationRecord
  belongs_to :thredded_post, class_name: 'Thredded::Post'
  belongs_to :user
end
