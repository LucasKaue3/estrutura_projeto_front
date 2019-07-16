E ('inserir o código {string} do atendente') do |código|
  $codigo.codigo_atendente(código)
end

Então('valide o código {string} do atendente invalido') do |código|
  $codigo.valida_codigo_invalido(código)
end

Entao('valide que está no home do sistema') do
  $codigo.valida_login_codigo_atendimento
end
