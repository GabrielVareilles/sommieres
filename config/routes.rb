# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  mount Sidekiq::Web => '/sidekiq'
  scope '(:locale)', locale: /fr/ do
    root to: 'calendar_admin/admin#index'
  end
end
