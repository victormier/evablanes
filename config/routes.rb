Evablanes::Application.routes.draw do
  mount Interpret::Engine => "/admin/interpret"

  # Backoffice
  namespace :admin do
    resources :projects, except: [:show] do
      post :toggle_published, :on => :member
      post :toggle_featured, :on => :member
      post :toggle_in_slider, :on => :member
      post :sort, :on => :collection
      resources :project_pictures, only: [:index, :new, :create]
    end
    resources :project_pictures, only: [:destroy] do
      post :sort, :on => :collection
    end
    resources :photos, only: [:index, :new, :create, :destroy] do
      post :sort, :on => :collection
      post :toggle_published, :on => :member
    end
    resources :users, only: [:index, :new, :create, :destroy]
    resources :translations, :only => [:index, :create] do
      get :other_langs, :on => :member
      get :missing, :on => :collection
      get :tools, :on => :collection
      get :export, :on => :collection
      post :import, :on => :collection
    end
    resources :key_values, only: [:update]
    match 'about' => 'static#about', as: :about
    match 'home' => 'static#home', as: :home

    if Rails.env.development?
      mount MailPreview => 'mail_view'
    end

    root to: 'projects#index'
  end

  scope ":i18n_locale" do
    localized(LOCALES_STRING) do
      resources :projects, only: [:index, :show]
      resources :contact, controller: :contact, only: [:index, :create]
      resources :photos, only: [:index]
      resources :sessions, only: [:new, :create, :destroy]
      resources :password_resets, only: [:new, :create, :edit, :update]

      match 'about' => 'static#about', as: :about
    end

    post 'newsletter' => 'newsletter#subscribe', as: 'newsletter_subscribe'

    # Sessions
    get 'logout' => 'sessions#destroy', as: 'logout'
    get 'login' => 'sessions#new', as: 'login'

    root to: 'static#index'
  end

  match '/' => 'static#index'
end
