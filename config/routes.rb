Rails.application.routes.draw do

  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: "welcome#index", as: :welcome
    post 'create_message', to: 'welcome#create_message', as: :create_message
  end
end
