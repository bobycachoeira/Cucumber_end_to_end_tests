login_page = LoginPage.new
home_page = HomePage.new


Dado("que eu esteja na pagina HOME do My Store") do
  home_page.load
end

Dado("que clique na barra de contacts no menu Sign in") do
  home_page.sign_in_link_page.click
end


Dado("visualize a área Already Registered?") do
  expect(login_page.already_registed_area.text).to have_content('ALREADY REGISTERED?')
end

Quando("informar no campo de email o valor {string}") do |email|
  login_page.email_address_field.native.clear
  login_page.email_address_field.set email
end

Quando("informar no campo password o valor {string}") do |password|
  login_page.password_field.native.clear
  login_page.password_field.set password
end

Quando("clicar no botão Sign in") do
  login_page.sign_in_button.click
end

Então("deve ser apresentado a mensagem de erro {string}") do |resultadoEsperado|
  expect(login_page.return_message_wrong_login.text).to have_content(resultadoEsperado)
end
