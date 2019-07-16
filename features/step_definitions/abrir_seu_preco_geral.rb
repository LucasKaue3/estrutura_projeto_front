Dado("abrir a janela seu preço") do    
    $preco_geral.abrir_seu_preco
end                                                                          
                                                                               
Então("validar que a janela foi aberta") do
    $preco_geral.valida_janela_preco_geral                                  
end                                                                          