Foswipe::Engine.routes.draw do
  resources :tickets do
    resources :comments
  end
  
  resources :comments

  namespace :admin do
    resources :tickets
    resources :organizations
    resources :products
    resources :purchases
    resources :admins 
      post '/admins/assign_tickets_to_supports' => 'admins#assign_tickets_to_supports'
    #end
    resources :clients
    resources :supports
    resources :foswipe_users
    get '/users/:id/approve'=> 'users#approve_user', as: 'approve_user'
  end
  resources :purchases

  resources :products

  resources :organizations

  devise_for :users, class_name: "Foswipe::User"

  resources :tickets do 
    get :all_tickets, :on => :collection
  end

  resources :supports

  resources :clients do 
    resources :tickets
  end

  resources :projects

  resources :admins

  root 'admins#index'
  #post '/assign_tickets_to_supports' => 'admins#assign_tickets_to_supports'
  post '/assign_support_notes_to_tickets' => 'supports#assign_support_notes_to_tickets'
end
