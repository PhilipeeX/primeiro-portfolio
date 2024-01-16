Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: "welcome#index", as: :welcome_index
    post 'create_message', to: 'welcome#create_message', as: :create_message
  end
end
