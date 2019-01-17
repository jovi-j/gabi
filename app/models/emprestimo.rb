class Emprestimo < ApplicationRecord
  belongs_to :user
  belongs_to :livro

  scope :atrasados, ->  {where("datadevolucao IS ? and dataemprestimo < ?", nil, Date.today - 21.days)}
  scope :ativos, ->  {where("datadevolucao IS ?", nil)}

  def set_datadevolucao
    self.datadevolucao = Date.today
  end

  def check_aluno()
    emprA = Emprestimo.where(user_id: self.user_id).length
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
