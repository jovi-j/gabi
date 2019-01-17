class AddNomeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nome, :string
  end
end
