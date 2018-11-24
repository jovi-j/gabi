json.extract! aluno, :id, :nome, :matricula, :cpf, :datanascimento, :endereco, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
