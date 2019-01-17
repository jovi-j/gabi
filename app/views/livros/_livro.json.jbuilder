json.extract! livro, :id, :titulo, :codigo, :autor, :especial, :created_at, :updated_at
json.url livro_url(livro, format: :json)
