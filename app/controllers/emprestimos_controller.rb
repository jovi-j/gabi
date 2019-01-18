class EmprestimosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_emprestimo, only: [:show, :edit, :update, :destroy, :devolucao]
  before_action :e, only: :create

  # GET /emprestimos
  # GET /emprestimos.json
  def index
    if current_user.admin?
    @emprestimos = Emprestimo.all
    else
    @emprestimos = Emprestimo.where(user_id: current_user)
    end
  end

  def search
    livro = Livro.where(codigo: eparams[:inf])
    user = User.where(matricula: eparams[:inf])
    @emprestimos = Emprestimo.search(livro_id: livro.id).or(user_id: user.id)
  end

  #GET /atrasados
  def atrasados
    if current_user.admin?
      @emprestimos = Emprestimo.atrasados
  else
      @emprestimos = Emprestimo.uatrasados
  end
    render "index"

  end

  #GET /ativos
  def ativos
    if current_user.admin?
        @emprestimos = Emprestimo.ativos
    else
        @emprestimos = Emprestimo.uativos
    end
    render "index"
  end

  # GET /emprestimos/1
  # GET /emprestimos/1.json
  def show
  end

  # GET /emprestimos/new
  def new
    @emprestimo = Emprestimo.new
  end

  # GET /emprestimos/1/edit
  def edit
  end

  # POST /emprestimos
  # POST /emprestimos.json
  def create
    @emprestimo = Emprestimo.new(e)

    respond_to do |format|
      if @emprestimo.check_aluno
          if @emprestimo.check_livro 
              if @emprestimo.save
                format.html { redirect_to @emprestimo, notice: 'O Emprestimo foi criado.' }
                format.json { render :show, status: :created, location: @emprestimo }
              else
                format.html { render :edit, notice: 'deu bosta.' }
                format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
              end
          else
            format.html { render :new, notice: 'O Livro está emprestado.'}
          end
      else
        format.html { render :new, notice: 'O aluno possui 3 empréstimos.' }

      end
  end
end

  # PATCH/PUT /emprestimos/1
  # PATCH/PUT /emprestimos/1.json
  def update
    respond_to do |format|
      if @emprestimo.update(eparams)
        format.html { redirect_to @emprestimo, notice: 'Emprestimo was successfully updated.' }
        format.json { render :show, status: :ok, location: @emprestimo }
      else
        format.html { render :edit }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprestimos/1
  # DELETE /emprestimos/1.json
  def destroy
    @emprestimo.destroy
    respond_to do |format|
      format.html { redirect_to emprestimos_url, notice: 'Emprestimo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def devolucao
    @emprestimo[:datadevolucao] = Date.today
    respond_to do |format|
      if @emprestimo.update(@emprestimo.attributes)
        format.html { redirect_to @emprestimo, notice: 'Emprestimo foi devolvido.' }
        format.json { render :show, status: :ok, location: @emprestimo }
      else
        format.html { render :edit }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = Emprestimo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eparams
        params.require(:emprestimo).permit(:user_id, :livro_id, :dataemprestimo, :datadevolucao, :matricula, :codigo)
    end

    def e
      user = User.where(matricula: eparams[:matricula]).first
      livro = Livro.where(codigo: eparams[:codigo]).first
      e = {user_id: user.id, livro_id: livro.id, dataemprestimo: Date.today, datadevolucao: nil}
    end
end
