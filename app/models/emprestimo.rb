class Emprestimo < ApplicationRecord
  belongs_to :aluno
  belongs_to :livro

  def self.set_datadevolucao
    self.datadevolucao = Date.today
  end

  def self.check_aluno(id)
    emprA = Emprestimos.where(aluno_id: id).lenght
    if emprA > 3
      return false
    end
    return true
  end

  def self.check_livro(id)
      emprL = Emprestimos.where(livro_id: id).lenght
      if emprL > 0
        return false
      end
      return true
  end

end
