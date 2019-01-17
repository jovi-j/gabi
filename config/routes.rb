Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :livros
  devise_for :users
  resources :emprestimos
  get 'atrasados', to: 'emprestimos#atrasados'
  get 'ativos', to: 'emprestimos#ativos'
  match 'devolucao/:id', to: 'emprestimos#devolucao', as: 'devolucao', via: :post
  root to: 'home#index'
end
