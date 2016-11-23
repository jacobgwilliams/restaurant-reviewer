class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :author, class_name: 'User'

  validates :review, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
