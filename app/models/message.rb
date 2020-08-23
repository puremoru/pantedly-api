class Message < ApplicationRecord
    belongs_to :sender, class_name: 'User', foreign_key: :sender_id
    belongs_to :reciever, class_name: 'User', foreign_key: :reciever_id

    validates :sender_id, presence: true
    validates :reciever_id, presence: true
    validates :content, presence: true
end
