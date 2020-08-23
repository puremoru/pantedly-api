Rails.application.routes.draw do
  scope :api do
    scope :auth do
      post '/signup', to: 'authentication#signup'
      post '/login', to: 'authentication#login'
    end
    resources :requirements, only: [:create, :index, :show]
    resources :companies, only: [:create, :show]
    resources :users, only: [:index]

    put '/users', to: 'users#update'
    put '/companies', to: 'companies#update'
    post '/interests/requirements/:requirement_id', to: 'interests#create'
    post '/entries/requirements/:requirement_id', to: 'entries#create'
    post '/scouts/users/:user_id', to: 'scouts#create'
  end 
end
