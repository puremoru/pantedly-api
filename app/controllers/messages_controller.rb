class MessagesController < ApplicationController
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
      :reciever_id,
      :content,
    )
  end
end
