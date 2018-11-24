require 'test_helper'

class EmprestimosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emprestimo = emprestimos(:one)
  end

  test "should get index" do
    get emprestimos_url
    assert_response :success
  end

  test "should get new" do
    get new_emprestimo_url
    assert_response :success
  end

  test "should create emprestimo" do
    assert_difference('Emprestimo.count') do
      post emprestimos_url, params: { emprestimo: { aluno_id: @emprestimo.aluno_id, datadevolucao: @emprestimo.datadevolucao, dataemprestimo: @emprestimo.dataemprestimo, livro_id: @emprestimo.livro_id } }
    end

    assert_redirected_to emprestimo_url(Emprestimo.last)
  end

  test "should show emprestimo" do
    get emprestimo_url(@emprestimo)
    assert_response :success
  end

  test "should get edit" do
    get edit_emprestimo_url(@emprestimo)
    assert_response :success
  end

  test "should update emprestimo" do
    patch emprestimo_url(@emprestimo), params: { emprestimo: { aluno_id: @emprestimo.aluno_id, datadevolucao: @emprestimo.datadevolucao, dataemprestimo: @emprestimo.dataemprestimo, livro_id: @emprestimo.livro_id } }
    assert_redirected_to emprestimo_url(@emprestimo)
  end

  test "should destroy emprestimo" do
    assert_difference('Emprestimo.count', -1) do
      delete emprestimo_url(@emprestimo)
    end

    assert_redirected_to emprestimos_url
  end
end
