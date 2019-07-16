# language: pt

@tc
@cadastrar_cliente
Funcionalidade: Cadastrar cliente

Contexto:
  Dado que acesse o terminal de consulta

@cadastrar_cliente_plus_senior
Esquema do Cenario: Validar cadastro de cliente plus e senior
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E inserir um cpf de um cliente não cadastrado
  E confirmar o cadastro do CPF do cliente
  E preencher os campos do cadastro "<tipoCliente>"
  Então validar que o cadastro foi realizado com sucesso

Exemplos:
  | filial        | código |     tipoCliente       |
  | ITU           |    0   | dataNascimento_plus   |
  | ITU           |    0   | dataNascimento_senior |

@alterar_dados_cliente
Esquema do Cenario: Realizar cadastro de cliente e alterar os dados
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E inserir um cpf de um cliente não cadastrado
  E confirmar o cadastro do CPF do cliente
  E preencher os campos do cadastro "<tipoCliente>"
  E validar que o cadastro foi realizado com sucesso
  E inserir o cpf do cliente que foi cadastrado
  Quando alterar os dados do cliente "<email_alteracao>"
  Então validar a mensagem "<mensagem>" na tela de alerta

Exemplos:
  | filial        | código |     tipoCliente       | email_alteracao |          mensagem           |
  | ITU           |    0   | dataNascimento_plus   |      email      | alteracaoCadastroComSucesso |
  | ITU           |    0   | dataNascimento_plus   | email_invalido  |  alteracaoCadastroInvalido  |
  | ITU           |    0   | dataNascimento_senior |      email      | alteracaoCadastroComSucesso |
  | ITU           |    0   | dataNascimento_senior | email_invalido  |  alteracaoCadastroInvalido  |

@cadastrar_cliente_com_dados_invalidos
Esquema do Cenario: Validar cadastro de cliente plus e senior
  Dado que realize o login com usuário "<filial>"
  E senha "<filial>"
  E inserir o código "<código>" do atendente
  E inserir um cpf de um cliente não cadastrado
  E confirmar o cadastro do CPF do cliente
  E cadastrar com informações inválidas "<dataNascimento>" "<sexo>" "<tipoTel>" "<ddd>" "<tel>"
  Então validar que o cadastro não foi realizado

Exemplos:
  | filial        | código |     dataNascimento      |     sexo      |     tipoTel      |     ddd      |     tel      |
  | ITU           |    0   | dataNascimento_invalido |               |                  |              |              |
  | ITU           |    0   |                         | sexo_invalido |                  |              |              |
  | ITU           |    0   |                         |               | tipoTel_invalido |              |              |
  | ITU           |    0   |                         |               |                  | ddd_invalido |              |
  | ITU           |    0   |                         |               |                  |              | tel_invalido |
