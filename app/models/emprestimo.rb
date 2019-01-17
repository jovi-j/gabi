class Emprestimo < ApplicationRecord
  belongs_to :user
  belongs_to :livro
  cattr_accessor :current_user

  scope :atrasados, ->  {where("datadevolucao IS ? and dataemprestimo < ?", nil, Date.today - 21.days)}

  scope :ativos, ->  {where("datadevolucao IS ?", nil)}

  scope :uatrasados, -> {where("datadevolucao IS ? and dataemprestimo < ?", nil, Date.today - 21.days).where(user_id: current_user)}

  scope :uativos, -> {where("datadevolucao IS ?", nil).where(user_id: current_user)}

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
