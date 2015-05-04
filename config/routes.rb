Rails.application.routes.draw do

  root 'balls#index'

  # The Golded 7 for the Ball model

  get '/balls/new' => 'balls#new'
  post '/balls' => 'balls#create'

  get '/balls' => 'balls#index'
  get '/balls/:id' => 'balls#show', as: 'ball'

  get '/balls/:id/edit' => 'balls#edit'
  patch '/balls/:id' => 'balls#update'

  delete '/balls/:id' => 'balls#destroy'

  # The Golded 7 for the Driver model

  get '/drivers/new' => 'drivers#new'
  post '/drivers' => 'drivers#create'

  get '/drivers' => 'drivers#index'
  get '/drivers/:id' => 'drivers#show', as: 'driver'

  get '/drivers/:id/edit' => 'drivers#edit'
  patch '/drivers/:id' => 'drivers#update'

  delete '/drivers/:id' => 'drivers#destroy'

end