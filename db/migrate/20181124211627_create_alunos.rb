class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :matricula
      t.string :cpf
      t.date :datanascimento
      t.string :endereco

      t.timestamps
    end
  end
end
