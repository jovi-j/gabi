class EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: [:show, :edit, :update, :destroy]

  # GET /emprestimos
  # GET /emprestimos.json
  def index
    @emprestimos = Emprestimo.all
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

    aluno = Aluno.where(matricula: emprestimo_params["matricula"]).first
    livro = Livro.where(titulo: emprestimo_params["titulo"]).first
    e = {:aluno_id => aluno.id, :livro_id => livro.id, :dataemprestimo => Date.today, :datadevolucao => nil}
    @emprestimo = Emprestimo.new(e)

    if @emprestimo.check_aluno(e["aluno_id"])
        if @emprestimo.check_livro(e["livro_id"])
          respond_to do |format|
          if @emprestimo.save
            format.html { redirect_to @emprestimo, notice: 'O Emprestimo foi criado.' }
            format.json { render :show, status: :created, location: @emprestimo }
            else
            format.html { render :new, notice: 'O Livro está emprestado.' }
            format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
          end
        else
        format.html { render :new, notice: 'O aluno possui 3 emprestimos.' }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /emprestimos/1
  # PATCH/PUT /emprestimos/1.json
  def update
    respond_to do |format|
      if @emprestimo.update(emprestimo_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = Emprestimo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emprestimo_params
      params.require(:emprestimo).permit(:matricula, :titulo)
    end
end
