class WelcomeController < ApplicationController
  def index
    @message = Message.new
  end

  def create_message
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = t('.success')
      redirect_to welcome_path
    else
      flash[:error] = t('.failure')
      redirect_to welcome_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:person_name, :person_mail, :description)
  end
end
