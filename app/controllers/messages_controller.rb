class MessagesController < ApplicationController
  def index
    if params[:destination_id]
      render json: { messages: Message.chat_history(@current_user.id, params[:destination_id]) }
    else
      render json: { message: 'destination_id is not set' }, status: 400 
    end
  end
  
  def create
    message = @current_user.sent_messages.new(create_message_params)
    if message.save
      render json: { message: 'Created' }, status: 201
    else
      render json: { message: 'Bad Request' }, status: 400
    end
  end

  private
  def create_message_params
    params.permit(
      :sender_id,
      :content,
    )
  end
end
