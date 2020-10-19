# encoding: UTF-8
include RSpec::Matchers
class PagamentoPage

  def validar_valor_total_pagamento
    expect(valor_frete.text).to include "$2.00"
    expect(valor_total_pagamento.text).to include "$18.51"
  end

  def finalzar_compra(tipo_pagamento)
    if tipo_pagamento == "transferência bancária"
      opcao_transferencia_bancaria.click
      confirmar_pedido
      expect(confirmacao_de_pedido.text).to include "ORDER CONFIRMATION"
    elsif tipo_pagamento == "cheque"
      opcao_cheque.click
      expect(validar_pagamento_cheque.text).to include "CHECK PAYMENT"
      click_link_or_button "I confirm my order"
      expect(confirmacao_de_pedido.text).to include "ORDER CONFIRMATION"
    end
  end

  def confirmacao_de_pedido
    find(".page-heading")
  end

  def valor_frete
    find("#total_shipping")
  end

  def valor_total_pagamento
    find("#total_price")
  end

  def validar_pagamento_cheque
    find(".page-subheading")
  end

  def opcao_cheque
    find(".cheque")
  end

  def confirmar_pedido
    click_link_or_button "I confirm my order"
  end

  def opcao_transferencia_bancaria
    find(".bankwire")
  end

end