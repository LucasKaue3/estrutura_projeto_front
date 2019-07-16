class CommonPage < SitePrism::Page

  element :campoPesquisaProduto, '#txtProduto'
  element :validapesquisaProduto, '#fora'
  element :btnpesquisaProduto, '#buttonProduto'
  element :optSimpes, '#optSimples'
  element :optCartao, '#optPlus'
  element :optUnivers, '#optUnivers'
  element :pesquisaCpf, '#txtCpfAtendimento'
  element :inputUnivers, '#nrCartao'
  element :campoCpfAtendimento, '#txtCpfAtendimento'
  element :btnCliente, '#buttonCliente'
  element :btnUnivers, '#buttonMatricula'
  element :optPrincipioAtivo, '#optPesquisaPorPrincipioAtivo'

  def cod_produto(produto)
    campoPesquisaProduto.set (produto)
    btnpesquisaProduto.click

    if produto == "princAtivo"
      optPrincipioAtivo.click
      campoPesquisaProduto.set (produto)
      btnpesquisaProduto.click
    end
  end

  def troca_de_pagina(index)
    page.driver.browser.window_handles[index]
  end

  def fechar_todas_paginas
    page.driver.browser.window_handles.each do |handle|
      page.driver.browser.switch_to.window(handle)
      page.execute_script 'window.close()'
    end
  end

  def validar_alerta_erro(msg)
    aguarde = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    aguarde.until { page.driver.browser.switch_to.alert }
    alerta = page.driver.browser.switch_to.alert.text
    if alerta != msg
      $log_erro = 'Mensagem do sistema não confere com a mensagem da massa'
      raise ArgumentError, $log_erro
    else
      page.driver.browser.switch_to.alert.accept
    end
  end

  def campo_desabilitado(id)
    page.evaluate_script("$('#{id}').attr('disabled');")
  end

  def confirmar_alerta
    aguarde = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    aguarde.until { page.driver.browser.switch_to.alert }
    page.driver.browser.switch_to.alert.accept
    aguarde1 = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    aguarde1.until { page.driver.browser.switch_to.alert }
    page.driver.browser.switch_to.alert.accept
  end

  def fechar_alerta
    aguarde = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    aguarde.until { page.driver.browser.switch_to.alert }
    page.driver.browser.switch_to.alert.dismiss
  end

  def validar_pesquisa_produto
    validapesquisaProduto.visible?
    # ativando o timeout com menos tempo para verificar elemento não existente, motivo da ativação de menos tempo: performar o teste
    Capybara.default_max_wait_time = 0.5
    result_pesquisa = validapesquisaProduto.has_text?("Produto não encontrado!")
    if result_pesquisa != false
      $log_erro = 'Produto Pesquisado é Inválido'
      raise ArgumentError, $log_erro
    end
    # ativando o timeout com o tempo normal após a validação do elemento não existente
    Capybara.default_max_wait_time = 10
  end

  def selecionar_tipo_cliente(tipoCliente, cpfPlus, cpfSenior, campoUnivers)
    case tipoCliente
    when "Simples"
      2.times{optSimpes.click}
    when "Plus"
      2.times{optCartao.click}
      pesquisaCpf.set (cpfPlus)
      btnCliente.click
    when "Senior"
      2.times{optCartao.click}
      pesquisaCpf.set (cpfSenior)
      btnCliente.click
    when "Univers"
      2.times{optUnivers.click}
      inputUnivers.set (campoUnivers)
      btnUnivers.click
    end
  end

  def gerar_cpf
    campoCpfAtendimento.visible?
    $cpf= Faker::CPF.numeric
    cpf_valido = $cpf
    campoCpfAtendimento.set (cpf_valido)
    campoCpfAtendimento.send_keys(:enter)
  end
end
