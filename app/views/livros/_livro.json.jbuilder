json.extract! livro, :id, :titulo, :autor, :editora, :anopublicacao, :edicao, :created_at, :updated_at
json.url livro_url(livro, format: :json)
