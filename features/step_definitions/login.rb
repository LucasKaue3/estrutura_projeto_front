Dado (/^que acesse o terminal de consulta$/) do
  visit $url_tc_hml
end

Dado ('que realize o login com usuário {string}') do |filial|
  $login.filial_login(filial)
end

E ('senha {string}') do |filial|
  $login.password.set buscar_massa('senha', filial)
  $login.senha_login
end

Dado ('que realize o login com sucesso') do
  $login.login_fixo
end

E ('valide que o usuário {string} logou com sucesso') do |filial|
  $login.validar_usuário_logado(filial)
end

E ('que valide que a senha está inválida') do
  $login.senha_invalida
  $login.msg_login_invalido
end

E ('realizar o logout do usuário {string}') do |filial|
  $login.logout(filial)
end

E ('valide que o usuário deslogou com sucesso') do
  $login.validar_logout
end
