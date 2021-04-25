class LoginsController < AuthenticationsController
  def new
    @login = Login.new
  end

  def create
    if auth?
      if logged?
        session[:user_id] = @user.id
        flash[:notice] = helpers.login_check[:success][:message]
        redirect_to helpers.login_check[:success][:path]
      else
        @login = Login.new(user_id: @user.id)

        if @login.save
          session[:user_id] = @user.id
          flash[:notice] = helpers.login_check[:success][:message]
          redirect_to helpers.login_check[:success][:path]
        else
          flash[:error] = helpers.login_check[:errors][:message]
          redirect_to helpers.login_check[:errors][:path]
        end
      end
    else
      flash[:error] = helpers.login_check[:errors][:message]
      redirect_to helpers.login_check[:errors][:path]
    end
  end

  def destroy
    @login = Login.find_by(user_id: params[:id])

    if @login.nil? || @login.destroy
      flash[:notice] = 'Saida dos sistema realizada com sucesso!'
      redirect_to root_path
    else
      flash[:error] = 'Não foi possível realizar a saida do sistema!'
      redirect_to home_path
    end
  end
end
