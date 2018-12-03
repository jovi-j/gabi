# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_24_211802) do

  create_table "alunos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "matricula"
    t.string "cpf"
    t.date "datanascimento"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emprestimos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "aluno_id"
    t.integer "livro_id"
    t.date "dataemprestimo"
    t.date "datadevolucao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_emprestimos_on_aluno_id"
    t.index ["livro_id"], name: "index_emprestimos_on_livro_id"
  end

  create_table "livros", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo"
    t.string "autor"
    t.string "editora"
    t.integer "anopublicacao"
    t.string "edicao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
