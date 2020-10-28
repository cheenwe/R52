Rails.application.routes.draw do

  resources :cloumn_downs
  resources :column_upcases

  namespace :sy do
    resources :configs
    resources :alarms
    resources :infos
    resources :services
    resources :apps
  end

  match "api/v1/heartbeat" => "sy/infos#heartbeat", via: [:get, :post]
  match "sy/monitor_api" => "sy/infos#monitor_api", via: [:get]

  match "sy" => "sy/infos#sy", via: [:get]
  match "monitor" => "sy/apps#home", via: [:get]


  namespace :bz do
    resources :versions
    resources :tools
  end

  match "bz/tool/upload" => "bz/tools#upload", via: [:get, :post]
  match "/down" => "bz/tools#down", via: [:get]
  match "/bz" => "bz/tools#index", via: [:get]


  # 兼职信息管理
  namespace :jz do
    resources :records
    resources :sxes
    resources :users
  end

  match "jz" => "jz/users#jz", via: [:get, :post]
  match "jz/sx" => "jz/sxes#sx", via: [:get, :post]
  match "shixi" => "jz/sxes#sx", via: [:get, :post]
  match "fc" => "jz/records#export", via: [:get]
  match "alipay" => "jz/records#alipay", via: [:get]
  match "api/jz/today" => "jz/records#today", via: [:get]


  match "/m/login" => "mobile#login", via: [:get, :post]
  match "/m/logout" => "mobile#logout", via: :post
  match "/m/home" => "mobile#home", via: :get
  match "/m/me" => "mobile#me", via: :get
  match "/m/clients" => "mobile#clients", via: [:get]
  match "/m/clients/:id" => "mobile#clients_show", via: [:get]
  match "/m/client" => "mobile#client", via:  [:get, :post]
  match "/m/tracks" => "mobile#tracks", via: [:get]
  match "/m/track" => "mobile#track", via:  [:get, :post]
  match "/m/api/track" => "mobile#track_api", via:  [:get, :post]


  # ldap域账户信息
  match "ldap" => "home#ldap", via: [:get, :post]

  match "/home" => "home#index", via: [:get]

  root "home#index"
end
