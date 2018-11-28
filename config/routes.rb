Rails.application.routes.draw do
  resources :emprestimos
  resources :livros
  resources :alunos
  get 'emprestimos/atrasados', to: 'emprestimos#atrasados'
  get 'emprestimos/ativos', to: 'emprestimos#ativos'
  match 'emprestimos/devolucao', to: 'emprestimos#devolucao', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
