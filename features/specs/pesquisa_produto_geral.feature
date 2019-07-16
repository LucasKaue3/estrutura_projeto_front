# language: pt

@tc
@pesquisa_produto_geral
Funcionalidade: Pesquisar Produtos por Tipo de Clientes

Contexto:
  Dado que acesse o terminal de consulta

@validar_pesquisa_produto_geral
Esquema do Cenario: Validar Pesquisa de Produtos Geral
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E clicar no tipo de cliente "<tipoCliente>"
  E inserir informações do produto "<tipoProduto>"
  Então validar que o produto foi pesquisado com sucesso

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

 
