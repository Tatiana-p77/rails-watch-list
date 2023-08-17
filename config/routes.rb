Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #   Un utilisateur peut voir toutes les listes
  get 'lists', to: 'lists#index'

  # Un utilisateur peut créer une nouvelle liste
  get 'lists/new', to: 'lists#new', as: :new_list

  # Un utilisateur peut voir les détails d’une liste donnée et son nom
  get 'lists/:id', to: 'lists#show', as: :list

  post 'lists', to: 'lists#create'

  # ROUTES POUR MOVIES
  resources :movies, only: [:index, :show]

  # ROUTES POUR BOOKMARKS

  # Ajout new signet à une liste
  # get 'lists/:list_id/bookmarks/new', to: 'bookmarks#new', as: :new_list_bookmark
  # post 'lists/:list_id/bookmarks', to: 'bookmarks#create'

  # # Pour supprimer un signet d'une liste
  # delete 'bookmarks/:id', to: 'bookmarks#destroy'

  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
