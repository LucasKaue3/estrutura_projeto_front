# language: pt

@tc
@codigo_do_atendente
Funcionalidade: Validar código do atendente

Contexto:
  Dado que acesse o terminal de consulta

@codigo_valido
Esquema do Cenario: Validar código do atendente válido
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  Entao valide que está no home do sistema

Exemplos:
  | filial        | código |
  | ITU           |   0    |


@codigo_invalido
Esquema do Cenario: Validar código do atendente inválido
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  Então valide o código "<código>" do atendente invalido

  Exemplos:
    | filial        | código |
    | ITU           | 999099 |
