Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'contacts#index'
  
  post '/api/insert_access' , to: 'api#insert_access'
  post '/api/insert_contact' , to: 'api#insert_contact'

  resources :contacts
end
