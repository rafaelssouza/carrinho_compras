Dado("estou na seção {string}") do |secao|
  if secao == "Woman"
    find("a[title='Women']").click
  end
end

Dado("adiciono o item {string} da lista de produtos") do |item|
  ProdutoPage.new.adicionar_item(item)
end

Então("valido os dados do resumo do produto no carrinho") do
  BotaoUtil.new.clicar_checkout
  ProdutoPage.new.validar_resumo_produto_carrinho
  BotaoUtil.new.clicar_checkout
end

Então("valido os dados do produto e valor total do pagamento") do
  ProdutoPage.new.validar_resumo_produto_carrinho
  PagamentoPage.new.validar_valor_total_pagamento
end

Dado("adiciono um item no carrinho") do
  steps %{
    Dado estou na seção "Woman"
  }
  ProdutoPage.new.adicionar_item("Faded Short Sleeve T-shirts")
end

Então("valido os dados do endereço de entrega do produto no carrinho") do
  EnderecoPage.new.validar_endereco_de_entrega
end

Então("valido os dados do endereço de faturamento do produto no carrinho") do
  EnderecoPage.new.validar_endereco_de_faturamento
  BotaoUtil.new.clicar_checkout
end

Quando("aceito os termos de serviço e opção de envio") do
  termo = find("#uniform-cgv")
  termo.click
  BotaoUtil.new.clicar_checkout
end

Quando("finalizo o pagamento através de {string}") do |tipo_pagamento|          
  PagamentoPage.new.finalzar_compra(tipo_pagamento)
end   
                                                                  