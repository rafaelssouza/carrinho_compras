# encoding: UTF-8
include RSpec::Matchers

class ProdutoPage
  
  def adicionar_item(item)
    visualizar_produto(item).hover
    adicionar_produto = find("a[title='Add to cart']")
    adicionar_produto.click
  end

  def validar_resumo_produto_carrinho
    expect(nome_do_produto.text).to include "Faded Short Sleeve T-shirts"
    expect(referencia_do_produto.text).to include "SKU : demo_1"
    expect(cor_e_tamanho.text).to include "Color : Orange, Size : S"
    expect(valor_unitario_produto.text).to include "$16.51"
    expect(valor_total_produto.text).to include "$16.51"
  end

  def visualizar_produtos_adicionados_no_meu_carrinho
    find(".continue").click
    visualizar_meu_carrinho.hover
    expect(quantidade_produto_meu_carrinho.text).to include "1"
    expect(nome_produto_meu_carrinho.text).to include "Faded..."
    expect(detalhe_produto_meu_carrinho.text).to include "Orange, S"
    expect(preco_produto_meu_carrinho.text).to include "$16.51"
    expect(preco_frete_meu_carrinho.text).to include "$2.00"
    expect(preco_total_meu_carrinho.text).to include "$18.51"
  end

  def nome_do_produto
    find(".cart_description .product-name")
  end

  def referencia_do_produto
    find(".cart_description .cart_ref")
  end

  def cor_e_tamanho
    find(".cart_description small a")
  end
  
  def valor_unitario_produto
    find("[data-title='Unit price']")
  end

  def valor_total_produto
    find("[data-title='Total']")
  end

  def visualizar_produto(item)
    find("a[class='product_img_link'][title='#{item}']")
  end

end