Rails.application.routes.draw do
  root "sessions#index"
  resources :sessions, only: [:index, :create]
  delete '/logout' => "sessions#destroy", as: 'logout'
  resources :users
  resources :sals, only: [:index, :create, :new, :update]
  get "/sals/:id/edit" => "sals#edit", as: "edit_sal"
  resources :accounts
  resources :payslips, only: [:create, :show]
  delete '/destroy/:id' => "payslips#destroy", as: "destroy_payslip"
  get "/payslips/new/:id" => "payslips#new", as: "new_payslip"
  get "/payslips/:id/all" => "payslips#index", as: "show_all"
  get "/success/:id" => "payslips#show", as: "success"
  get "/payslips" => "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
