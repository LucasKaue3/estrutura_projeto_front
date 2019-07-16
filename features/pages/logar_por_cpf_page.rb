class LogarPorCpf < SitePrism::Page

  element :campoCpfAtendimento, "#txtCpfAtendimento"
  element :pesquisaCpf, "#buttonCliente"
  element :listaClientes, "#tabClientes"
  element :menuAtendimento, "#slideMenu"
  element :btnBuscaAvancada, "#LinkBuscaAvancada"
  element :campoRgOuCartao, "#recadRgCartao"
  element :tabelaCartao, "#tabClientes"

  def pesquisa_por_cpf(cpf)
    campoCpfAtendimento.visible?
    campoCpfAtendimento.set (cpf)
    campoCpfAtendimento.send_keys(:enter)
  end

  def pesquisa_cpf_cadastrado
    campoCpfAtendimento.visible?
    campoCpfAtendimento.set ($cpf)
    campoCpfAtendimento.send_keys(:enter)
    sleep 2
  end

  def selecionar_plano(codCartao)
    page.find(id= "#tabClientes").visible?
    page.find(id= "#tabClientes", text: codCartao).click
  end

  def menu_atendimento
    # foi necessario usario o XPATH nesse metodo, verificar com o dev para adicionar ID em casa opção de menu
    page.find(:xpath, "//*[@id='slideMenu']/div[1]").visible?
    page.find(:xpath, "//*[@id='slideMenu']/div[1]").click
    page.find(id= "#sub1", text: "Consultar Cliente").visible?
    page.find(id= "#sub1", text: "Consultar Cliente").click
  end

  def validar_dados_do_cliente(campo_nome, campo_Cpf, campo_numero_cartao)
    page.find(id = '#tblCli').visible?
    resultado_nome = page.find(id = '#tblCli').has_text?(campo_nome)
    resultado_cpf = page.find(id = '#tblCli').has_text?(campo_nome)
    resultado_cartao = page.find(id = '#tblCli').has_text?(campo_nome)
    if(resultado_nome == false || resultado_cpf == false || resultado_cartao == false)
      $log_erro = "Verificar se o NOME, CPF ou NÚMERO do cartão que estão na massa, estão batendo com o sistema"
      raise ArgumentError, $log_erro
    end
  end

  def busca_avancada
    btnBuscaAvancada.visible?
    btnBuscaAvancada.click
  end

  def pesquisa_por_rg(rg)
    campoRgOuCartao.visible?
    campoRgOuCartao.set rg
    campoRgOuCartao.send_keys(:enter)
  end

  def valida_msg_erro_por_rg(rg)
    campoRgOuCartao.visible?
    campoRgOuCartao.set rg
    campoRgOuCartao.send_keys(:enter)
  end

  def selecionar_cartao
    # foi necessario usario o XPATH nesse metodo, verificar com o dev para adicionar ID em casa opção de menu
    page.find(:xpath, '//*[@id="tabClientes"]/tbody/tr[2]').visible?
    page.find(:xpath, '//*[@id="tabClientes"]/tbody/tr[2]').click
  end

  def validar_campo_rg_cartao
    campoRgOuCartao.visible?
  end

end
