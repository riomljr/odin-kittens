Rails.application.routes.draw do
  get 'kittens/index'
  get 'kittens/show'
  get 'kittens/new'
  get 'kittens/edit'
  get 'kittens/create'
  get 'kittens/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
