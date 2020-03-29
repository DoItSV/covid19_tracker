Rails.application.routes.draw do
  resources :devices, only: %i[show create]
end
