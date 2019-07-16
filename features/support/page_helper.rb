Dir[File.join(File.dirname(__FILE__),
              '../pages/*_page.rb')].each { |file| require file }

# Modulos para chamar as classes instanciadas
module Pages
  $login = LoginPage.new

  $codigo = CodigoAtendente.new

  $cliente_univers = ClienteUnivers.new

  $logar_cpf_atendimento = LogarPorCpf.new

  $common = CommonPage.new

  $cliente_simples = ClienteSimples.new

  $cadastrar_clientes = CadastrarClientes.new 

  $preco_geral = PrecoGeral.new
end
