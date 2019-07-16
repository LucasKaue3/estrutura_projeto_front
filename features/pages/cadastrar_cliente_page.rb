class CadastrarClientes < SitePrism::Page
  element :formularioCliente, '#formAlteraCadastro'
  element :campoNome, '#txtNome'
  element :campoRg, '#numRg'
  element :campoTipoEmissor, "select[id='selectTipoEmissor']"
  element :campoDataNascimento, '#dtNasc'
  element :campoSexo, "select[id='txtSexo']"
  element :campoBeneficio, '#beneficio'
  element :campoPensionista, '#chkInss'
  element :campoTipoTel1, "select[id='tpTel1']"
  element :campoDDDTel1, '#numDdd'
  element :campoNumTel1, '#numTel'
  element :campoTipoTel2, "select[id='tpTel2']"
  element :campoDDDTel2, '#numDdd2'
  element :campoNumTel2, '#numTel2'
  element :campoEmail, '#email'
  element :campoCep, '#numCep'
  element :btnVerificaCep, '#verificarCEP'
  element :campoTipoEndereco, "select[id='tpEnd']"
  element :campoEndereco, '#txtLogra'
  element :campoNumeroLogradouro, '#numNumero'
  element :campaoComplLogradouro, '#txtCompl'
  element :campoBairro, '#txtBairro'
  element :campoCidade, '#txtCidade'
  element :campoUF, '#txtUf'
  element :campoChkEmail, '#chkEmail'
  element :btnCadastrar, '#btCad'
  element :btnCancelar, '#btCad'
  element :msgCamposInvalidos, '#dialogRevisarCadastro'
  element :msgCadastroAlterado, '#popup_message'
  element :btnConfirmaCadastroAlterado, '#popup_ok'


  def informacoes_cliente(cliente)
    $nome= Faker::Name.name
    $nome = $nome.gsub(%r{[",.^$/]}, '')
    $email= Faker::Internet.email
    campoNome.set ($nome)
    $rg= $cpf[0..8]
    campoRg.set ($rg)
    campoTipoEmissor.select('SSP')
    campoDataNascimento.set (cliente)
    campoSexo.select('M')
    campoTipoTel1.select('Residencial')
    campoDDDTel1.set ('11')
    campoNumTel1.set ('44445555')
    campoEmail.set ($email)
    campoCep.set ('03281001')
    btnVerificaCep.click
    campoTipoEndereco.select ('R')
    campoNumeroLogradouro.set ('69')
    campaoComplLogradouro.set ('ap 666')
    btnCadastrar.click
    page.find('.ui-button.ui-widget.ui-state-default.ui-corner-all.ui-button-text-only', text: "Nao").visible?
    page.find('.ui-button.ui-widget.ui-state-default.ui-corner-all.ui-button-text-only', text: "Nao").click
  end

  def informacoes_cliente_invalido(campoData, selectSexo, campoTipoTel, campoDDD, campoTel)
    $nome= Faker::Name.name
    $nome = $nome.gsub(%r{[",.^$/]}, '')
    campoNome.set ($nome)
    $rg= $cpf[0..8]
    campoRg.set ($rg)
    campoTipoEmissor.select('SSP')
    campoDataNascimento.set (campoData || '17/09/2000')
    campoSexo.select(selectSexo || 'M')
    campoTipoTel1.select(campoTipoTel || 'Residencial')
    campoDDDTel1.set (campoDDD || '11')
    campoNumTel1.set (campoTel || '44445555')
    campoEmail.set ($email || "teste_email_invalido")
    campoCep.set ('03281001')
    btnVerificaCep.click
    campoTipoEndereco.select ('R')
    campoNumeroLogradouro.set ('69')
    campaoComplLogradouro.set ('ap 666')
    btnCadastrar.click
  end

  def validar_msg_cadastro(msg)
    page.find(id = '#mensagem').visible?
    mensagem_texto = page.find(id = '#mensagem').text
    resultado = mensagem_texto == msg
    if resultado == false
      $log_erro = "Mensagem esperada: #{msg} - não foi identificada"
      raise ArgumentError, $log_erro
     end
  end

  def validar_cadastro_cliente
    nome_page = page.find(id='#nomeCliente').text.downcase
    validar_nome = $nome.downcase
    resultado = nome_page == validar_nome
    if resultado == false
      $log_erro = "Cliente não identificado: #{$nome}"
      raise ArgumentError, $log_erro
    end
  end

  def validar_cadastro_nao_realizado
    msgCamposInvalidos.visible?
    valida_msg = msgCamposInvalidos.has_text?("Campos não informados ou inválidos")
    if valida_msg == false
      $log_erro = "Não foi possível validar que o cadastro não foi efetuado, verificar os elementos da página"
      raise ArgumentError, $log_erro
    end
  end

  def alterar_dados_cliente(email_alerta)
    page.find(".menutitle", text: "Atendimento").visible?
    page.find(".menutitle", text: "Atendimento").click
    2.times{page.find(".itemMenu", text: "Consultar Cliente").click}
    formularioCliente.visible?
    campoEmail.set (email_alerta)
  end

  def validar_alteracao_cadastro(mensagem)
    btnCadastrar.click
    if mensagem == 'alteracaoCadastroComSucesso'
      msgCadastroAlterado.visible?
    end

    if mensagem == 'alteracaoCadastroInvalido'
      msgCamposInvalidos.visible?
    end
  end
end
