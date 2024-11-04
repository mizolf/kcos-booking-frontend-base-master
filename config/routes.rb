Rails.application.routes.draw do

  devise_for :admins
  root "pages#home"
  post "/tinymce_assets", to: "tinymce_assets#create"
  get "cookies",          to: "pages#cookies", as: "cookies"
  get "toolkit",          to: "toolkit#index"

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  get 'rezervacija/:token',               to: 'space_bookings#show', as: :space_booking
  resources :posts,                       only: [:index, :show], path: :novosti
  resources :documents,                   only: :index, path: :dokumenti
  resources :faqs,                        only: :index, path: 'cesto-postavljana-pitanja'
  resources :legal_pages,                 only: :show, path: 'pravne-stranice'

  resources :spaces, path: :prostori do
    member do

      scope :rezervacija do
        get 'opcenito',                   to: 'space_bookings#general', as: :booking_general
        post 'opcenito',                  to: 'space_bookings#save_general', as: :booking_save_general
        get 'dohvati-termine',            to: 'space_bookings#get_terms', as: :get_date_terms
        get 'datumi',                     to: 'space_bookings#dates', as: :booking_dates
        post 'datumi',                    to: 'space_bookings#save_dates', as: :booking_save_dates
        post 'dodaj-termin',              to: 'space_bookings#add_term', as: :add_term
        delete 'ukloni-termin/:term_id',  to: 'space_bookings#destroy_term', as: :destroy_term
      end

      scope :najam do
        get 'zahtjev',                    to: 'space_rent_requests#new', as: :new_space_rent_request
        post 'zahtjev',                   to: 'space_rent_requests#create', as: :space_rent_requests
      end

    end
  end

  namespace :admin do
    root "admins#index"
    get "toolkit", to: "toolkit#index"
    resources :admins,                      path: :administratori
    resource :admin_account,                only: [:show, :update], path: :racun
    resources :spaces,                      path: :prostori
    resources :space_bookings,              path: :rezervacije do
      member do
        patch 'posalji-notifikaciju', to: 'space_bookings#send_update_email', as: :send_notification
      end
    end
    resources :space_rent_requests,         only: [:index, :show], path: :zahtjevi
    resources :space_booking_terms,         only: :none, path: 'termini' do
      member do
        patch 'status/:status', to: 'space_booking_terms#change_status'
      end
    end
    resources :posts,                       path: :novosti
    get 'neobjavljene-novosti',             to: 'posts#index', defaults: { filter: :unpublished }, as: :unpublished_posts
    resources :page_meta_tags,              only: [:index, :show, :update], path: 'meta-oznake-stranica'
    resources :documents,                   only: [:index, :show, :new, :create, :update, :destroy], path: :dokumenti do
      collection do
        patch :sort
      end
    end
    resources :faqs,                        only: [:index, :show, :new, :create, :update, :destroy], path: :pitanja do
      collection do
        patch :sort
      end
    end
    resources :legal_pages,                 only: [:index, :new, :create, :show, :update, :destroy], path: 'pravne-stranice' do
      collection do
        patch :sort
      end
    end
    resource :app_setting,                  only: [:show, :update], settings: /tekst-pristanka/, path: 'postavke/:settings'
    resource :landing_page,                 only: [:show, :update], path: 'pocetna-stranica'
  end

end
