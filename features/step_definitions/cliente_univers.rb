Quando('selenionar a opção univers') do
  $cliente_univers.opcao_de_atendimento
end

Então('validar que o código do cliente é inválido') do
  $cliente_univers.validar_cliente_pesquisado_por_id_invalido
end

Então('validar que é aberto o sistema de login do autorizador Univers') do
  # Verificar uma possibilidade de troca de paginação com o IE
end

Então('validar que o cliente {string} é apresentado com sucesso') do |cliente|
  nome = buscar_massa('Univers', cliente)
  $cliente_univers.validar_cliente_pesquisado_por_id(nome)
end

Quando('inserir o nome da empresa {string}') do |empresa|
  $cliente_univers.nomeEmpresa(empresa)
end

Quando('inserir o id do plano de saúde') do
  $cliente_univers.idPlanoSaude.set buscar_massa('Univers', 'idCliente')
  $cliente_univers.pesquisar_univers
end

Então('validar que o cliente do plano selecionado é apresentado com sucesso') do
  nome = buscar_massa('Univers', 'nomeClienteNrPlanoSaude')
  $cliente_univers.validar_cliente_pesquisado_por_id(nome)
end

Quando('realizar pesquisa') do
  $cliente_univers.pesquisar_univers
end

Quando('validar a mensagem com alerta {string}') do |mensagemAlerta|
  $cliente_univers.pesquisar_univers
  msg = buscar_massa('Mensagens', mensagemAlerta)
  $common.validar_alerta_erro(msg)
end

Quando('validar a mensagem com texto {string}') do |mensagemTexto|
  msg = buscar_massa('Mensagens', mensagemTexto)
  retorno_msg = msg.gsub("ã", 'a')
  $cliente_univers.validar_msg_texto(retorno_msg)
end

Quando('inserir o id inválido no plano de saúde') do
  $cliente_univers.idPlanoSaude.set buscar_massa('Univers', 'idClienteInvalido')
  $cliente_univers.pesquisar_univers
end

Quando('inserir o id univers {string} do fluxo verde') do |univers|
  $cliente_univers.idUnivers.set buscar_massa('Univers', univers)
end

Quando('inserir o id univers {string} do fluxo laranja') do |univers|
  $cliente_univers.idUnivers.set buscar_massa('Univers', univers)
  $cliente_univers.pesquisar_univers
end

Quando('inserir o id univers inválido {string}') do |univers|
  $cliente_univers.idUnivers.set buscar_massa('Univers', univers)
  $cliente_univers.pesquisar_univers
end
