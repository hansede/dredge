Dredge::Application.routes.draw do
  root :to => 'dredge#index'
  get '/parse', :to => 'cards#parse'
  get '/card', :to => 'cards#by_name'
  get '/card/:card_id/price', :to => 'prices#by_card'
  get '/release/:release_id/price', :to => 'prices#by_release'
end
