# language: pt

@tc
@login
Funcionalidade: Realizar Login

Contexto:
  Dado que acesse o terminal de consulta

@login_valido
Esquema do Cenario: Realizar login valido e logout
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E valide que o usuário "<filial>" logou com sucesso
  Entao realizar o logout do usuário "<filial>"

Exemplos:
  | filial        |
  | ITU           |
  | ACLIMACAO 123 |

@login_invalido
Cenario: Realizar login invalido
  Dado que valide que a senha está inválida
