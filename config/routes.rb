require "sidekiq/web"

Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ar/ do
    devise_for :users, controllers: {
      registrations: "customers/registrations",
      sessions: "customers/sessions"
    }

    devise_for :users, path: "admin", as: "admin", skip: %i[registrations passwords confirmations], controllers: {
      sessions: "admin/sessions"
    }

    authenticate :user, ->(u) { u.admin? } do
      mount Sidekiq::Web => "/admin/sidekiq"
    end

    root "storefront/home#index"

    namespace :storefront do
      resources :payments, only: [] do
        collection do
          get :success
          get :failure
          post :webhook
        end
      end
    end

    resources :categories, only: [:show], controller: "storefront/categories", param: :slug
    resources :products, only: %i[index show], controller: "storefront/products", param: :slug
    get :search, to: "storefront/searches#index"
    resource :cart, only: [:show], controller: "storefront/carts" do
      post :add_item
      patch :update_item
      delete :remove_item
    end
    resource :checkout, only: [:show, :create], controller: "storefront/checkouts"
    resources :orders, only: [:index, :show], controller: "storefront/orders" do
      member do
        get :invoice
        patch :cancel
      end
    end
    resources :pages, only: [:show], controller: "storefront/pages", param: :slug

    namespace :admin do
      root to: "dashboard#index"
      resources :products do
        resources :product_images, only: %i[create destroy]
      end
      resources :categories
      resources :banners
      resources :variant_types
      resources :orders do
        member do
          get :invoice
          patch :update_status
          patch :update_payment_status
        end
      end
      resources :preorders, only: [:index]
      resource :setting, only: %i[show update]
      resources :pages
    end
  end
end
