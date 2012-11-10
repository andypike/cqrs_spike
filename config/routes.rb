CqrsForum::Application.routes.draw do
  root :to => 'forums#index'

  resources :forums
end
