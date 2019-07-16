# language: pt

@tc
@login_cpf
Funcionalidade: Realizar Login por CPF de Cliente

Contexto:
  Dado que acesse o terminal de consulta

@pesquisa_por_rg_invalido
Esquema do Cenario: Realizar pesquisa por RG inválido
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E clicar em busca avançada
  E pesquisar por um RG "<cliente>"
  Então valide a mensagem "<mensagem>"

Exemplos:
  | filial        |  cliente   |         mensagem         | código |
  | ITU           | RgInvalido | camposIdUniversInvalidos |   0    |

@validar_campo_rg_ao_errar_cpf
Esquema do Cenario: Validar campo RG habilitado ao errar o CPF
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E pesquisar por um CPF "<cliente>"
  Então valide que ao errar o CPF a opção de pesquisa por RG é habilitada

Exemplos:
  | filial        |   cliente   | código |
  | ITU           |             |   0    |

@pesquisa_por_rg_valido
Esquema do Cenario: Realizar pesquisa por RG válido
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E clicar em busca avançada
  E pesquisar por um RG "<cliente>"
  Quando selecionar o cliente
  Então valide os dados do cliente

Exemplos:
  | filial        | cliente  | código |    cartao    |
  | ITU           | rgValido |   0    | numeroCartao |


@pesquisa_por_cpf_valido
Esquema do Cenario: Realizar pesquisa por CPF válido
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E pesquisar por um CPF "<cliente>"
  E selecionar o plano do cliente "<cartao>"
  E faça a consulta do cliente
  Então valide os dados do cliente

Exemplos:
  | filial        |  cliente  |    cartao    | código |
  | ITU           | cpfValido | numeroCartao |   0    |
