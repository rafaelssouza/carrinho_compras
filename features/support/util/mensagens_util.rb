Então("vejo a mensagem {string}") do |mensagem|
  @texto = find("div[class='layer_cart_product col-xs-12 col-md-6'] h2")
  expect(@texto.text).to eq mensagem
end