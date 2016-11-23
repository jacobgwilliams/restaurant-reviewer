post '/restaurants/:restaurant_id/reviews' do
  require_login
  @review = Review.new(params[:review])
  @review.author_id = current_user.id
  @review.restaurant_id = params[:restaurant_id]
  if @review.save
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @creator = User.find_by(id: @restaurant.creator_id)
    @ya_did_it = true
    erb :'restaurants/show'
  else
    erb :'restaurants/show'
  end
end
