Rails.application.routes.draw do
  authenticated :user, ->(user) {user.admin?} do
    get 'admin', to: 'admin#index'
    get 'admin/users'
    get 'admin/show_user/:id', to: "admin#show_user", as: 'admin_user'
    get 'admin/weektimes'
    get 'admin/show_weektime/:id', to: "admin#show_weektime", as: 'admin_weektime'
    get 'admin/affaires'
    get 'admin/show_affaire/:id', to: "admin#show_affaire", as: 'admin_affaire'
  end
  


  root 'pages#index'

  devise_for :users, controllers: {
                                    sessions: 'users/sessions',
                                    registrations:'users/registrations'
                                  }

  resources :weektimes do
    resources :worktimes
  end
  post "worktimes/:id/toggle", to: "worktimes#toggle" #bouton checkbox worktime
  post "weektimes/:id/upper", to: "weektimes#upper" #bouton checkbox_all worktime

  resources :affaires


  
  
end
