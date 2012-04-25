Nyilvantartas::Application.routes.draw do
  resources :users

  get "users/new"

  get "users/edit"

  get "users/forgotten"

  match 'members/search' => 'members#search'
  match 'members/advanced_search' => 'members#advanced_search'
  resources :members

  resources :projects

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
