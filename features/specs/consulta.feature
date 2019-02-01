# language: pt
Funcionalidade: Consulta produto
    Sendo um cliente do sistema de teste
    Possa pesquisar produtos no sistema de testes
    Para que eu possa efetuar compras co sistema de testes


Contexto:Estar na pagina HOME do My Store
    Dado que eu esteja na pagina HOME do My Store


Cenario: Pesquisar produto não existente
    Quando informar no campo de pesquisa de produto por "inexistente"
    E clique no botão pesquisar produto
    Então deve ser apresentada a mensagem de erro "No results were found for your search \"inexistente\""


Cenario: Pesquisar produto não existente
    Quando informar no campo de pesquisa de produto por "Printed Chiffon"
    E clique no botão pesquisar produto
    Então deve ser apresentada a interface com o resultado da busca
