Rails.application.routes.draw do
  root 'site#index'
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  post '/contact-submit' => 'site#contact_submit', as: :submit_contact
  resources :menu_items, only: [:index, :show], path: 'our-food'
  resources :locations, only: [:index, :show]
  get '/search' => 'search_results#index'
  get '/location-search' => 'search_results#location_search_index'

  namespace :admin do
    get '/' => 'base#index'
    resources :menu_items
    resources :locations
  end
end
