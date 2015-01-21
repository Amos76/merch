Rails.application.routes.draw do
  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/edit'

  root "products#index"
end
