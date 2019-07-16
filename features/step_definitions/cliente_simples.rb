Dado("clicar na opção cliente simples") do
  $cliente_simples.selecionar_opção_cliente_simples
end

Dado("validar que o campo de pesquisa de produto está desabilitado") do
  $cliente_simples.validar_campo_produto_desabilitado
end

Então("validar que o campo de pesquisa de produto está habilitado") do
  $cliente_simples.validar_campo_produto_habilitado
end
