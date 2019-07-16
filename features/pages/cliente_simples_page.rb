class ClienteSimples < SitePrism::Page
  element :opcaoClienteSimples, '#optSimples'
  element :campoTxtProduto, '#txtProduto'

  def selecionar_opção_cliente_simples
    opcaoClienteSimples.visible?
    opcaoClienteSimples.click
  end

  def validar_campo_produto_desabilitado
    desabilitado = $common.campo_desabilitado('#txtProduto')
    if desabilitado != true
      $log_erro = 'Não foi identificado o campo desabilitado'
      raise ArgumentError, $log_erro
    end
  end

  def validar_campo_produto_habilitado
    habilitado = $common.campo_desabilitado('#txtProduto')
    if habilitado != false
      $log_erro = 'Não foi identificado o campo desabilitado'
      raise ArgumentError, $log_erro
    end
  end
end
