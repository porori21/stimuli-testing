Rails.application.routes.draw do
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :recipients
  resources :questions
  resources :user_questions
  resources :users

  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'login' => :destroy
  end

  root 'admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
