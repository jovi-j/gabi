class CreateEmprestimos < ActiveRecord::Migration[5.2]
  def change
    create_table :emprestimos do |t|
      t.references :aluno, foreign_key: true
      t.references :livro, foreign_key: true
      t.date :dataemprestimo
      t.date :datadevolucao

      t.timestamps
    end
  end
end
