get '/restaurants' do
  erb :'restaurants/index'
end

get '/restaurants/new' do
  require_login
  @restaurant = Restaurant.new
  erb :'restaurants/new'
end

post '/restaurants' do
  require_login
  @restaurant = Restaurant.new(params[:restaurant])
  @restaurant.creator_id = current_user.id
  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    erb :'restaurants/new'
  end
end

get '/restaurants/:id' do
  @reviewed = false
  review_author_ids = [] # I'm sorry, my brain is literally dead at this point. I couldn't sleep last night becuase of trump
  @restaurant = Restaurant.find_by(id: params[:id])
  @restaurant.reviews.each {|review| review_author_ids << review.author_id }
  if logged_in? && review_author_ids.include?(current_user.id)
    @reviewed = true
  end
  @ratings = @restaurant.reviews
  @creator = User.find_by(id: @restaurant.creator_id)
  erb :'restaurants/show'
end

get '/restaurants/:id/edit' do
  require_login
  @restaurant = Restaurant.find_by(id: params[:id])
  redirect "/restaurants/#{params[:id]}" unless @restaurant.creator_id == current_user.id
  erb :'restaurants/edit'
end

put '/restaurants/:id' do
  require_login
  @restaurant = Restaurant.find_by(id: params[:id])
  if @restaurant.creator_id != current_user.id
    redirect "restaurants/#{params[:id]}"
  else
    if @restaurant && @restaurant.update(params[:restaurant])
      redirect "restaurants/#{params[:id]}"
    else
      erb :'/restaurants/edit'
    end
  end
end

delete '/restaurants/:id' do
  require_login
  restaurant = Restaurant.find_by(id: params[:id])
  if restaurant.creator_id != current_user.id #extra protection? Not sure if folks can access this route manually
    redirect '/'
  end
  restaurant.destroy
  redirect '/'
end
