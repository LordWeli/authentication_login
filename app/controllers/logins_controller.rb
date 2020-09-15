class LoginsController < AuthenticationsController
  def new
    @login = Login.new
  end

  def create
    if auth?
      @login = Login.new(user_id: @user.first.id)
      
      if @login.save
        session[:user] = @user
        flash[:notice] = 'Login feito com sucesso!'
        redirect_to root_path
      else
        flash[:error] = 'Nome de usuário ou senha está errado!'
        redirect_to root_path
      end
    else
      flash[:error] = 'Nome de usuário ou senha está errado!'
      redirect_to root_path
    end
  end
end
