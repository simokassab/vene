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

    authenticate :admin_user, ->(u) { u.admin? } do
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
      post :apply_coupon
      delete :remove_coupon
    end
    resource :checkout, only: [:show, :create], controller: "storefront/checkouts" do
      post :review
      post :validate_city
    end
    resources :orders, only: [:index, :show], controller: "storefront/orders" do
      member do
        get :invoice
        patch :cancel
      end
    end
    resource :guest_registration, only: [:new, :create], controller: "storefront/guest_registrations"
    resources :addresses, only: [:create, :update, :destroy], controller: "storefront/addresses" do
      member do
        patch :set_default
      end
    end
    resources :pages, only: [:show], controller: "storefront/pages", param: :slug
    resources :wishlist_items, only: [:index, :create, :destroy],
              controller: "storefront/wishlists", path: "wishlist"

    namespace :admin do
      root to: "dashboard#index"
      resources :products do
        resources :product_images, only: %i[create destroy]
      end
      resources :categories
      resources :sub_categories
      resources :banners
      resources :variant_types
      resources :coupons do
        member do
          patch :toggle_active
        end
      end
      resources :orders do
        member do
          get :invoice
          patch :update_status
          patch :update_payment_status
          post :create_shipment
          get :tracking
        end
      end
      resources :preorders, only: [:index]
      resources :wishlists, only: [:index]
      resources :webhooks, only: [:index, :show]
      resource :setting, only: %i[show update]
      resources :pages
    end
  end
end
