content_for_users = [
  { :email => "test@test.com",
    :username => "testman",
    :password => "password"},
  { :email => "test2@test.com",
    :username => "testman",
    :password => "password"}
]

content_for_restaurants = [
  { :name => "Cracker Barrel",
    :cuisine => "Southern Cooking",
    :address => "123 Mama Dip Road",
    :city => "Henderson",
    :state => "NC",
    :zip_code => 27565,
    :creator_id => 1},
  { :name => "Barrel o Crackers",
    :cuisine => "The OPPOSITE of Southern Cooking",
    :address => "321 Daddy Dip Avenue",
    :city => "Handyman",
    :state => "ND",
    :zip_code => 11113,
    :creator_id => 2}
]

content_for_reviews = [
  { :review => "These Crackers are AWFUL",
    :rating => 1,
    :restaurant_id => 1,
    :author_id => 2},
  { :review => "These barrels are GREAT!",
    :rating => 5,
    :restaurant_id => 2,
    :author_id => 1}
]

User.create!(content_for_users)
Restaurant.create!(content_for_restaurants)
Review.create!(content_for_reviews)
