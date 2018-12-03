class Emprestimo < ApplicationRecord
  belongs_to :aluno
  belongs_to :livro

  scope :atrasados, ->  {where("datadevolucao IS ? and dataemprestimo < #{Date.today - 14.days}", nil)}
  scope :ativos, ->  {where("datadevolucao IS ?", nil)}

  def set_datadevolucao
    self.datadevolucao = Date.today
  end

  def check_aluno()
    emprA = Emprestimo.where(aluno_id: self.aluno_id).length
    if emprA > 3
      return false
    end
    return true
  end

  def check_livro()
    emprL = Emprestimo.where(livro_id: self.livro_id).length
      if emprL > 0
        return false
      end
      return true
  end

end
