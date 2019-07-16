# language: pt

@tc
@cliente_simples
Funcionalidade: Pesquisa cliente Simples

Contexto:
  Dado que acesse o terminal de consulta

@validar_checkbox_habilitado
Esquema do Cenario: Validar checkbox habilitado
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E clicar na opção cliente simples
  Então validar que o campo de pesquisa de produto está habilitado

Exemplos:
  | filial        | código |
  | ITU           |    0   |

@validar_checkbox_desabilitado
Esquema do Cenario: Validar checkbox desabilitado
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  Então validar que o campo de pesquisa de produto está desabilitado

Exemplos:
  | filial        | código |
  | ITU           |    0   |
