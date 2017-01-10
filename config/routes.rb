Rails.application.routes.draw do
  resources :html_contents, only: [:index, :create]
end
