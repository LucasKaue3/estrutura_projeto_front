class PrecoGeral < SitePrism::Page

element :telaSeuPreco, '#melhorpreco_idCorpo'

    def abrir_seu_preco
      if $tipoProdutoTabela == "descProd" || $tipoProdutoTabela == "princAtivo"
        page.find(:xpath,  '//*[@id="tabMedicamentos"]/tbody/tr[2]').click
      end
      page.find(:class=> "melhorpreco_", match: :first).visible?
      page.find(:class=> "melhorpreco_", match: :first).click
    end

    def valida_janela_preco_geral
      telaSeuPreco.visible?
    end
end
