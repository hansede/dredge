Dredge::Application.routes.draw do
  get '/parse', :to => 'cards#parse'
end
