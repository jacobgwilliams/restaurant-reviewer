class Restaurant < ActiveRecord::Base
  has_many :reviews
  belongs_to :creator, class_name: 'User'

  validates :name, presence: true, uniqueness: true
  validates :address, :cuisine, :city, :state, :zip_code, presence: true
  validates :zip_code, length: { is:5 }
  validates :state, length: { is:2 }

  def city_state
    self.city + ", " + self.state
  end

  def full_address
    self.address + ", " + self.city_state + " " + self.zip_code.to_s
  end

  def average_rating
    ratings = []
    self.reviews.each do |review|
      ratings << review.rating
    end
    divisor = ratings.length
    (ratings.reduce(:+))/divisor
  end

end
