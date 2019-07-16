Dado("pesquisar por um CPF {string}") do |cliente|
  cpf = buscar_massa('Cliente', cliente)
  $logar_cpf_atendimento.pesquisa_por_cpf(cpf)
end

Dado("selecionar o plano do cliente {string}") do |cartao|
  codCartao = buscar_massa('Cliente', cartao)
  $logar_cpf_atendimento.selecionar_plano(codCartao)
end

Dado("faça a consulta do cliente") do
  $logar_cpf_atendimento.menu_atendimento
end

Então('valide os dados do cliente') do
  campo_nome = buscar_massa('Cliente', 'nome')
  campo_Cpf = buscar_massa('Cliente', 'validarCpf')
  campo_numero_cartao = buscar_massa('Cliente', 'validarNumeroCartao')
  $logar_cpf_atendimento.validar_dados_do_cliente(campo_nome, campo_Cpf, campo_numero_cartao)
end

Dado("clicar em busca avançada") do
  $logar_cpf_atendimento.busca_avancada
end

Dado("pesquisar por um RG {string}") do |cliente|
  rg = buscar_massa('Cliente', cliente)
  $logar_cpf_atendimento.valida_msg_erro_por_rg(rg)
end

Quando("selecionar o cliente") do
  $logar_cpf_atendimento.selecionar_cartao()
end

Então("valide que ao errar o CPF a opção de pesquisa por RG é habilitada") do
  $logar_cpf_atendimento.validar_campo_rg_cartao
end
