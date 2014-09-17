Foswipe::Engine.routes.draw do
  resources :user_groups

  resources :tickets do
    resources :comments do
      post :create_note, :on => :collection
    end
  end

  resources :comments

  resources :purchases

  resources :products

  resources :organizations

  devise_for :users, class_name: "Foswipe::User", module: :devise

  resources :tickets do
    get :all_tickets, :on => :collection
  end

  resources :supports

  resources :clients do
    resources :tickets
  end

  resources :projects

  resources :users

  resources :admins

  root 'admins#index'
  #post '/assign_tickets_to_supports' => 'admins#assign_tickets_to_supports'
  post '/assign_support_notes_to_tickets' => 'supports#assign_support_notes_to_tickets'

end
