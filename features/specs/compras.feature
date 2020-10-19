#language: pt

Funcionalidade: Criar Usuário
- Eu como Usuário
- Quero efetuar a compra de produtos com diferentes formas de pagamento

Contexto:
  Dado que estou logado com usário válido

@testando
Cenário: Validar inclusão de produto com sucesso

  E estou na seção "Woman"
  Quando adiciono o item "Faded Short Sleeve T-shirts" da lista de produtos
  Então vejo a mensagem "Product successfully added to your shopping cart"
 
@testando
Esquema do Cenário: Efetuar compra de produto através de transferêcia bancaria e cheque
  Cenário responsável por efetuar compras através de transferêcia bancaria e cheque validando
  o fluxo de compras do carrinho

  Quando adiciono um item no carrinho
  Então valido os dados do resumo do produto no carrinho
  E valido os dados do endereço de entrega do produto no carrinho
  E valido os dados do endereço de faturamento do produto no carrinho
  Quando aceito os termos de serviço e opção de envio
  E valido os dados do produto e valor total do pagamento
  Então finalizo o pagamento através de "<tipo_pagamento>"

  Exemplos:
  | tipo_pagamento         |
  | transferência bancária |
  | cheque                 |

