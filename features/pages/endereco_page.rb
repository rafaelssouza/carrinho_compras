# encoding: UTF-8
include RSpec::Matchers

class EnderecoPage
  
  def validar_endereco_de_entrega
    @tipo_endereco = "#address_delivery"
    expect(nome_endereco.text).to include "Rafael Souza"
    expect(descricao_endereco.text).to include ""
    expect(cidade_estado_codigo_postal.text).to include "Cidade teste, South Carolina 00000"
    expect(pais.text).to include "United States"
    expect(telefone_movel.text).to include "99999999999"
  end

  def validar_endereco_de_faturamento
    @tipo_endereco = "#address_invoice"
    expect(nome_endereco.text).to include "Rafael Souza"
    expect(descricao_endereco.text).to include ""
    expect(cidade_estado_codigo_postal.text).to include "Cidade teste, South Carolina 00000"
    expect(pais.text).to include "United States"
    expect(telefone_movel.text).to include "99999999999"
  end

  def nome_endereco
    find("#{@tipo_endereco} .address_firstname.address_lastname")
  end

  def descricao_endereco
    find("#{@tipo_endereco} .address_address1.address_address2")
  end

  def cidade_estado_codigo_postal
    find("#{@tipo_endereco} .address_city.address_state_name.address_postcode")
  end

  def pais
    find("#{@tipo_endereco} .address_country_name")
  end

  def telefone_movel
    find("#{@tipo_endereco} .address_phone_mobile")
  end

end