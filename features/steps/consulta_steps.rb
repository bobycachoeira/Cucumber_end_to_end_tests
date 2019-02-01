home_page = HomePage.new
consulta_page = ConsultaPage.new


Quando("informar no campo de pesquisa de produto por {string}") do |valorPesquisa|
  home_page.search_field.set valorPesquisa
end

Quando("clique no botão pesquisar produto") do
  home_page.search_button.click
end


Então("deve ser apresentada a mensagem de erro {string}") do |resultadoEsperado|
  expect(home_page.message_error_search.text).to have_content(resultadoEsperado)
end

Então("deve ser apresentada a interface com o resultado da busca") do
  expect(consulta_page.message_page_result_search.text).to have_content("SEARCH  \"PRINTED CHIFFON\"")
  expect(consulta_page.message_page_result_search.text).to have_content("2 results have been found.")
end
