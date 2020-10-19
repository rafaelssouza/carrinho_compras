class Login < SitePrism::Page
    set_url 'index.php?controller=my-account'
    element :email, '#email'
    element :senha, '#passwd'

    element :entrar, '#SubmitLogin'

    def login_usuario_valido
        email.set 'automacao@teste.com'
        senha.set 'teste123'
        entrar.click
    end

end