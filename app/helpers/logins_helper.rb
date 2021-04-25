module LoginsHelper
  def login_check
    {
      success:  {
        message: 'Login feito com sucesso!',
        path: home_index_path
      },
      errors: {
        message: 'Nome de usuário ou senha está errado!',
        path: root_path
      }
    }
  end
end
