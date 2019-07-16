Então("valide a mensagem {string}") do |mensagem|
  msg = buscar_massa('Mensagens', mensagem)
  $common.validar_alerta_erro(msg)
end

Então("inserir informações do produto {string}") do |tipoProduto|
  produto = buscar_massa('produto', tipoProduto)
  $tipoProdutoTabela = tipoProduto
  $common.cod_produto(produto)
end

Então("validar que o produto foi pesquisado com sucesso") do
  $common.validar_pesquisa_produto
end

Então("clicar no tipo de cliente {string}") do |tipoCliente|
  cpfPlus = buscar_massa('Cliente', 'cpfPlus')
  cpfSenior = buscar_massa('Cliente','cpfSenior')
  campoUnivers = buscar_massa('Univers','idUniversVerde')
  $common.selecionar_tipo_cliente(tipoCliente, cpfPlus, cpfSenior, campoUnivers)
end
