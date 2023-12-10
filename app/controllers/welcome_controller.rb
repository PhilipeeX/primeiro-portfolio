class WelcomeController < ApplicationController
  def index
    @message = Message.new
  end

  def create_message
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'Mensagem enviada com sucesso!'
      redirect_to welcome_path
    else
      flash[:error] = 'Houve um erro ao tentar enviar a mensagem.'
      redirect_to welcome_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:person_name, :person_mail, :description)
  end
end
