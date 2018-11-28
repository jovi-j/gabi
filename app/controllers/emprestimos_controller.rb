class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: [:show, :edit, :update, :destroy]
  before_action :e, only: [:create]

  # GET /emprestimos
  # GET /emprestimos.json
  def index
    @emprestimos = Emprestimo.all
  end

  #GET /atrasados
  def atrasados
    @emprestimos = Emprestimo.where("datadevolucao = IS NULL and dataemprestimo < #{Date.today - 14.days}")
    render "index"
  end

  #GET /ativos
  def ativos
    @emprestimos = Emprestimo.where(:datadevolucao == nil)
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
            byebug
          end
      else
        format.html { render :new, notice: 'O aluno possui 3 emprestimos.' }

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
    eparams[:datadevolucao] = Date.today
    respond_to do |format|
      if @emprestimo.update(eparams)
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
      if params[:matricula].blank?
        params.require(:emprestimo).permit(:aluno_id, :livro_id,:dataemprestimo, :datadevolucao)
      else
        params.require(:emprestimo).permit(:matricula, :titulo)  
      end
      
    end

    def e
      aluno = Aluno.where(matricula: eparams[:matricula]).first
      livro = Livro.where(titulo: eparams[:titulo]).first
      e = {aluno_id: aluno.id, livro_id: livro.id, dataemprestimo: Date.today, datadevolucao: nil}
    end
end
