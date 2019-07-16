Dado("inserir um cpf de um cliente não cadastrado") do
  $common.gerar_cpf
end

Dado("confirmar o cadastro do CPF do cliente") do
  $common.confirmar_alerta
end

Dado("preencher os campos do cadastro {string}") do |tipoCliente|
  cliente = buscar_massa('Cliente', tipoCliente)
  $cadastrar_clientes.informacoes_cliente(cliente)
end

Então("validar que o cadastro foi realizado com sucesso") do
  $cadastrar_clientes.validar_cadastro_cliente
end

Dado("confirmar o cadastro do cliente com a mensagem {string}") do |mensagem|
  msg = buscar_massa('Mensagens', mensagem)
  $cadastrar_clientes.validar_msg_cadastro(msg)
end

Dado("cadastrar com informações inválidas {string} {string} {string} {string} {string}") do |dataNascimento, sexo, tipoTel, ddd, tel|
  campoData = buscar_massa('Cadastro_Invalido', dataNascimento)
  selectSexo = buscar_massa('Cadastro_Invalido', sexo)
  campoTipoTel = buscar_massa('Cadastro_Invalido', tipoTel)
  campoDDD = buscar_massa('Cadastro_Invalido', ddd)
  campoTel = buscar_massa('Cadastro_Invalido', tel)
  $cadastrar_clientes.informacoes_cliente_invalido(campoData, selectSexo, campoTipoTel, campoDDD, campoTel)
end

Então("validar que o cadastro não foi realizado") do
  $cadastrar_clientes.validar_cadastro_nao_realizado
end

Dado("inserir o cpf do cliente que foi cadastrado") do
  $logar_cpf_atendimento.pesquisa_cpf_cadastrado
end

Quando("alterar os dados do cliente {string}") do |email_alteracao|
  email_alerta = buscar_massa('Cliente', email_alteracao)
  $cadastrar_clientes.alterar_dados_cliente(email_alerta)
end

Então("validar a mensagem {string} na tela de alerta") do |mensagem|
  $cadastrar_clientes.validar_alteracao_cadastro(mensagem)
end
