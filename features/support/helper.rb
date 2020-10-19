module  Helper
    
    def tirar_foto(nome_arquivo, resultado)
        caminho_arquivo = "/screenshot/teste_#{resultado}"
        foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
        page.save_screenshot(foto)
        embed(foto, 'imagem/png', 'Clique aqui')
    end
    
end