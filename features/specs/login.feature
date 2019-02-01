# language: pt
@login
Funcionalidade: Login Teste Practice
    Sendo um usuário do sistema de teste
    Possa efetuar login no sistema de testes
    Para que eu possa efetuar compras co sistema de testes

Contexto:Estar na pagina HOME do My Store
    Dado que eu esteja na pagina HOME do My Store


Cenario: Efetuando login com usuário e senha inválidos
    Dado que clique na barra de contacts no menu Sign in
    E visualize a área Already Registered?
    Quando informar no campo de email o valor "emailerrado"
    E informar no campo password o valor "senha errada"
    E clicar no botão Sign in
    Então deve ser apresentado a mensagem de erro "Invalid email address."

Cenario: Efetuando login com campos e-mail e senha vazios
    Dado que clique na barra de contacts no menu Sign in
    E visualize a área Already Registered?
    Quando informar no campo de email o valor ""
    E informar no campo password o valor ""
    E clicar no botão Sign in
    Então deve ser apresentado a mensagem de erro "An email address required."
@nilson
Cenario: Efetuando login sem informar e-mail
    Dado que clique na barra de contacts no menu Sign in
    E visualize a área Already Registered?
    Quando informar no campo de email o valor ""
    E informar no campo password o valor "teste"
    E clicar no botão Sign in
    Então deve ser apresentado a mensagem de erro "An email addressssss required."

Cenario: Efetuando login sem informar senha
    Dado que clique na barra de contacts no menu Sign in
    E visualize a área Already Registered?
    Quando informar no campo de email o valor "teste@teste.com"
    E informar no campo password o valor ""
    E clicar no botão Sign in
    Então deve ser apresentado a mensagem de erro "Password is required."
