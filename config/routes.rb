Rails.application.routes.draw do
  authenticated :user, ->(user) {user.admin?} do
    get 'admin', to: 'admin#index'
    get 'admin/users'
    get 'admin/weektimes'
    get 'admin/show_weektime/:id', to: "admin#show_weektime", as: 'admin_weektime'
    get 'admin/affaires'
  end

  root 'pages#index'

  resources :weektimes do
    resources :worktimes
  end
  resources :affaires

  devise_for :users
end
