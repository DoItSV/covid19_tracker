Rails.application.routes.draw do
  resources :devices, only: %i[show create] do
    scope module: :devices do
      resources :alerts, only: %i[index show create]
      resources :locations, only: %i[index show create]
    end
  end
end
