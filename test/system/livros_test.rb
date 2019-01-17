require "application_system_test_case"

class LivrosTest < ApplicationSystemTestCase
  setup do
    @livro = livros(:one)
  end

  test "visiting the index" do
    visit livros_url
    assert_selector "h1", text: "Livros"
  end

  test "creating a Livro" do
    visit livros_url
    click_on "New Livro"

    fill_in "Autor", with: @livro.autor
    fill_in "Codigo", with: @livro.codigo
    fill_in "Especial", with: @livro.especial
    fill_in "Titulo", with: @livro.titulo
    click_on "Create Livro"

    assert_text "Livro was successfully created"
    click_on "Back"
  end

  test "updating a Livro" do
    visit livros_url
    click_on "Edit", match: :first

    fill_in "Autor", with: @livro.autor
    fill_in "Codigo", with: @livro.codigo
    fill_in "Especial", with: @livro.especial
    fill_in "Titulo", with: @livro.titulo
    click_on "Update Livro"

    assert_text "Livro was successfully updated"
    click_on "Back"
  end

  test "destroying a Livro" do
    visit livros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Livro was successfully destroyed"
  end
end
