# language: pt

@tc
@cliente_univers
Funcionalidade: Pesquisa cliente Univers

Contexto:
  Dado que acesse o terminal de consulta

@pesquisa_cliente_univers_valido_fluxo_verde
Esquema do Cenario: Pesquisar cliente Univers por id Univers válido com fluxo verde
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  Quando selenionar a opção univers
  E inserir o id univers "<univers>" do fluxo verde
  E realizar pesquisa
  Então validar que o cliente "<cliente>" é apresentado com sucesso

  Exemplos:
    | filial        | código |     univers    |          cliente          |
    | ITU           |    0   | idUniversVerde | nomeClienteIdUniversVerde |

 @pesquisa_cliente_univers_valido_fluxo_laranja
 Esquema do Cenario: Pesquisar cliente Univers por id Univers válido com fluxo laranja
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  Quando selenionar a opção univers
  E inserir o id univers "<univers>" do fluxo laranja
 Então validar que é aberto o sistema de login do autorizador Univers

 Exemplos:
    | filial        | código |      univers     |
    | ITU           |    0   | idUniversLaranja |

@pesquisa_cliente_univers_invalido
Esquema do Cenario: Pesquisar cliente Univers por id Univers inválido
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  Quando selenionar a opção univers
  E inserir o id univers inválido "<univers>"
  Então validar que o código do cliente é inválido

  Exemplos:
    | filial        | código |       univers       |
    | ITU           |    0   |  idUniversInvalido  |

@pesquisa_cliente_univers_por_empresa_e_plano_de_saude_validos
Esquema do Cenario: Pesquisar cliente Univers por empresa e id do plano de saúde válidos
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  Quando selenionar a opção univers
  E inserir o nome da empresa "<empresa>"
  E inserir o id do plano de saúde
  Então validar que o cliente do plano selecionado é apresentado com sucesso

  Exemplos:
    | filial        | código |      empresa        |
    | ITU           |    0   |  unimed paulistana  |

@pesquisa_cliente_univers_por_empresa_e_plano_de_saude_invalidos
Esquema do Cenario: Pesquisar cliente Univers por empresa e id do plano de saúde inválidos
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  Quando selenionar a opção univers
  E inserir o nome da empresa "<empresa>"
  E validar a mensagem com alerta "<mensagemAlerta>"
  E inserir o id inválido no plano de saúde
  Então validar a mensagem com texto "<mensagemTexto>"

  Exemplos:
    | filial        | código |      empresa        |      mensagemAlerta      |       mensagemTexto      |
    | ITU           |    0   |  unimed paulistana  |    campoIdObrigatorio    | camposIdUniversInvalidos |
