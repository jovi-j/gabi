Rails.application.routes.draw do
  resources :emprestimos
  resources :livros
  resources :alunos
  get 'atrasados', to: 'emprestimos#atrasados'
  get 'ativos', to: 'emprestimos#ativos'
  match 'devolucao/:id', to: 'emprestimos#devolucao', as: 'devolucao', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
