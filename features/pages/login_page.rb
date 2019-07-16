class LoginPage < SitePrism::Page

  element :username, "select[id='cmbFilial']"
  element :password, '#txtSenha'
  element :login, '#buttonOK'
  element :codAtendente, '#txtAtendente'
  element :btnAtendente, '#buttonAtendenteOK'
  element :btnAtendente, '#buttonAtendenteOK'

  def filial_login(filial)
    username.visible?
    username.select(filial, match: :first)
  end

  def senha_login
    login.visible?
    login.click
  end

  def login_fixo
    username.visible?
    username.select('ITU', match: :first)
    password.set 'branco5'
    login.click
  end

  def senha_invalida
    password.visible?
    password.set 'Invalida01059689583'
    login.click
  end

  def validar_usuário_logado(filial)
    page.find(id = '#info').visible?
    validar_usuário = page.find(id = '#info').has_text?(filial)
    if validar_usuário == false
      # informando o tipo de erro caso usuário logado for diferente do usuário presente no terminal de consulta
      $log_erro = 'Usuário logado não é o mesmo apresentado no terminal de constula'
      raise ArgumentError, $log_erro
    end
  end

  def logout(filial)
      page.find(id = '#info').visible?
    page.find(id = '#info', text: filial).click
  end

  def validar_logout
    username.visible?
  end

  def msg_login_invalido
    aguarde = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    aguarde.until { page.driver.browser.switch_to.alert }
    @msg_senha_invalida = page.driver.browser.switch_to.alert.text
    @resultado = @msg_senha_invalida == 'Senha inválida!'
    if @resultado == true
      page.driver.browser.switch_to.alert.accept
    else
      $log_erro = 'A mensagem da senha inválida não é igual a mensagem esperada'
      raise ArgumentError, $log_erro
    end
  end
end
