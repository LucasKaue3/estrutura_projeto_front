class CodigoAtendente < SitePrism::Page
  element :codAtendente, '#txtAtendente'
  element :btnAtendente, '#buttonAtendenteOK'
  element :btnNovoAtendimento, '#atendimento'

  def codigo_atendente(código)
    codAtendente.visible?
    codAtendente.set código
    btnAtendente.click
  end

  def valida_login_codigo_atendimento
    btnNovoAtendimento.visible?
  end

  def msg_cod_invalido
    @msg_cod_atendente_invalid = page.driver.browser.switch_to.alert.text
    @resultado = @msg_cod_atendente_invalid == 'Atendente Inválido'
    if @resultado == true
      page.driver.browser.switch_to.alert.accept
    else
      $log_erro = 'O código do atendente não é igual a mensagem esperada'
      raise ArgumentError, $log_erro
    end
  end

  def valida_codigo_invalido(código)
    codAtendente.visible?
    codAtendente.set código
    btnAtendente.click
    aguarde = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    aguarde.until { page.driver.browser.switch_to.alert }
    @msg_cod_atendente_invalid = page.driver.browser.switch_to.alert.text
    @resultado = @msg_cod_atendente_invalid == 'Atendente Inválido'
    if @resultado == true
      page.driver.browser.switch_to.alert.accept
    else
      $log_erro = 'O código do atendente não é igual a mensagem esperada'
      raise ArgumentError, $log_erro
    end
  end
end
