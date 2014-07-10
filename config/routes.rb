Rails.application.routes.draw do
  root 'site#index'
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  post '/contact-submit' => 'site#contact_submit', as: :submit_contact
  resources :menu_items, only: [:index, :show], path: 'our-food'
end
