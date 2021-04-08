class LoginsController < AuthenticationsController
  def new
    @login = Login.new
  end

  def create
    if auth?
      @login = Login.new(user_id: @user.first.id)

      if @login.save
        session[:user_id] = @user.first.id
        flash[:notice] = 'Login feito com sucesso!'
        redirect_to home_index_path
      else
        flash[:error] = 'Nome de usuário ou senha está errado!'
        redirect_to root_path
      end
    else
      flash[:error] = 'Nome de usuário ou senha está errado!'
      redirect_to root_path
    end
  end

  def destroy
    @login = Login.find_by(user_id: params[:id])

    if @login.destroy
      flash[:notice] = 'Saida dos sistema realizada com sucesso!'
      redirect_to root_path
    else
      flash[:error] = 'Não foi possível realizar a saida do sistema!'
      redirect_to home_path
    end
  end
end
