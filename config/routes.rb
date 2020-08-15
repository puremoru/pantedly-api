Rails.application.routes.draw do
  scope :api do
    scope :auth do
      post '/signup', to: 'authentication#signup'
      post '/login', to: 'authentication#login'
    end
    resources :requirements, only: [:create, :index, :show]
  end 
end
