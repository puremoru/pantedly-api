class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  belongs_to :reciever, class_name: 'User', foreign_key: :reciever_id

  validates :sender_id, presence: true
  validates :reciever_id, presence: true
  validates :content, presence: true

  def self.chat_history(current_user_id, destination_id)
    Message
        .where(sender_id: current_user_id, reciever_id: destination_id)
        .or(
          Message.where(sender_id: destination_id, reciever_id: current_user_id)
        )
        .order(created_at: :asc)
  end
end
