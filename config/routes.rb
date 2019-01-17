Rails.application.routes.draw do
  resources :livros
  devise_for :users
  resources :emprestimos
  get 'atrasados', to: 'emprestimos#atrasados'
  get 'ativos', to: 'emprestimos#ativos'
  match 'devolucao/:id', to: 'emprestimos#devolucao', as: 'devolucao', via: :get
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
