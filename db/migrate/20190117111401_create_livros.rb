class CreateLivros < ActiveRecord::Migration[5.2]
  def change
    create_table :livros do |t|
      t.string :titulo
      t.string :codigo
      t.string :autor
      t.boolean :especial

      t.timestamps
    end
  end
end
