class User < ActiveRecord::Base
  has_many :reviews, foreign_key: :author_id, class_name: Review
  has_many :restaurants, foreign_key: :creator_id, class_name: Restaurant

  validates :email, :username, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  has_secure_password

end
