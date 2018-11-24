json.extract! emprestimo, :id, :aluno_id, :livro_id, :dataemprestimo, :datadevolucao, :created_at, :updated_at
json.url emprestimo_url(emprestimo, format: :json)
