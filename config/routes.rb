Rails.application.routes.draw do
  root 'profiles#index'

  devise_for :users
  resources :chat_list_items
  resources :blocklists
  resources :favourites
  resources :message_statuses
  resources :messages
  resources :chats
  resources :profiles
  resources :users
end
