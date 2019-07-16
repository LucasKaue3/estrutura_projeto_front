# language: pt

@tc
@abrir_seu_preco_geral
Funcionalidade: Abrir a janela seu preço

Contexto:
  Dado que acesse o terminal de consulta

@abrir_seu_preco
Esquema do Cenario: Abrir a janela seu preço
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E clicar no tipo de cliente "<tipoCliente>"
  E inserir informações do produto "<tipoProduto>"
  E abrir a janela seu preço
  Então validar que a janela foi aberta

Exemplos:
  | filial        | código | tipoProduto |  tipoCliente  |
  | ITU           |    0   |     ean     |    Simples    |
  | ITU           |    0   |   codProd   |    Simples    |
  | ITU           |    0   |   descProd  |    Simples    |
  | ITU           |    0   |  princAtivo |    Simples    |
  | ITU           |    0   |     ean     |     Plus      |
  | ITU           |    0   |   codProd   |     Plus      |
  | ITU           |    0   |   descProd  |     Plus      |
  | ITU           |    0   |  princAtivo |     Plus      |
  | ITU           |    0   |     ean     |    Senior     |
  | ITU           |    0   |   codProd   |    Senior     |
  | ITU           |    0   |   descProd  |    Senior     |
  | ITU           |    0   |  princAtivo |    Senior     |
  | ITU           |    0   |     ean     |   Univers     |
  | ITU           |    0   |   codProd   |   Univers     |
  | ITU           |    0   |   descProd  |   Univers     |
  | ITU           |    0   |  princAtivo |   Univers     |
