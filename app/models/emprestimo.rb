class Emprestimo < ApplicationRecord
  belongs_to :aluno
  belongs_to :livro
end
