class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @emprestimosAtrasados = Emprestimo.uatrasados
    @emprestimosAtivos = Emprestimo.uativos
  end
end
