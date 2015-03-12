TechReviewSite::Application.routes.draw do
  root 'top#index'
  get '/station/:id' => 'products#show'
  get '/search' => 'top#search'
end
