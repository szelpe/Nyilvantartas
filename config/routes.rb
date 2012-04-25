Nyilvantartas::Application.routes.draw do
  root :to => 'home#index'
  get "users/forgotten"
  match 'members/search' => 'members#search'
  match 'members/advanced_search' => 'members#advanced_search'  
  
  resources :users
  resources :members
  resources :projects
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
