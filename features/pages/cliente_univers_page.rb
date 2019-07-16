class ClienteUnivers < SitePrism::Page
  element :opcaoUnivers, '#optUnivers'
  element :idUnivers, '#nrCartao'
  element :btnConfirmaPesquisa, '#buttonMatricula'
  element :msgClienteNaoEncontrado, '#clienteNaoEncontrado'
  element :empresaOpSaude, '#txtEmpresa'
  element :idPlanoSaude, '#txtMatricula'

  def opcao_de_atendimento
    opcaoUnivers.visible?
    opcaoUnivers.click
  end

  def nomeEmpresa(empresa)
    empresaOpSaude.visible?
    empresaOpSaude.set empresa
    page.find(:xpath, '//*[@id="body"]/ul/li/a', text: 'UNIMED PAULISTANA').click
  end

  def nomeOperacaoSaude(planoSaude)
    idPlanoSaude.visible?
    idPlanoSaude.set planoSaude
  end

  def pesquisar_univers
    btnConfirmaPesquisa.visible?
    btnConfirmaPesquisa.click
    sleep 2
  end

  def id_univers_invalido
    idUnivers.visible?
    idUnivers.set('999909090909')
    btnConfirmaPesquisa.click
  end

  def validar_cliente_pesquisado_por_id(nome)
    page.find(id = '#tblCli').visible?
    resultado = page.find(id = '#tblCli').has_text?(nome)
    if resultado == false
      $log_erro = 'O nome do cliente não é o mesmo nome da massa de dados'
      raise ArgumentError, $log_erro
    end
  end

  def validar_msg_alerta(msg)
    mensagem_alerta = page.driver.browser.switch_to.alert.text
    resultado = mensagem_alerta == msg
    if resultado == true
      page.driver.browser.switch_to.alert.accept
    else
      $log_erro = "Mensagem esperada: #{msg} - não foi identificada"
      raise ArgumentError, $log_erro
    end
  end

  def validar_msg_texto(retorno_msg)
    page.find(id = '#clienteNaoEncontrado').visible?
    mensagem_texto = page.find(id = '#clienteNaoEncontrado').text
    resultado = mensagem_texto == retorno_msg
    if resultado == false
      $log_erro = "Mensagem esperada: #{retorno_msg} - não foi identificada"
      raise ArgumentError, $log_erro
    end
  end

  def validar_cliente_pesquisado_por_id_invalido
    msgClienteNaoEncontrado.visible?
    msg_cliente_nao_encontrado = msgClienteNaoEncontrado.text
    resultado_msg = msg_cliente_nao_encontrado == 'Cliente nao encontrado!'
    if resultado_msg == false
      $log_erro = 'A mensagem do Cliente não encontrado não confere com a mensagem retornada no sistema'
      raise ArgumentError, $log_erro
    end
  end
end
