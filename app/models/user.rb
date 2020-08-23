class User < ApplicationRecord
  belongs_to :company, optional: true
  has_many :interests, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :scouts, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :recieved_messages, class_name: 'Message', foreign_key: :reciever_id
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.search_by_address(prefecture, city)
    if prefecture && city
      User.where(company_id: nil, prefecture: prefecture, address1: city)
    elsif prefecture && !city
      User.where(company_id: nil, prefecture: prefecture)
    elsif
      User.where(company_id: nil, address1: city)
    end

  end

  def self.get_collocutors(current_user_id)
    messages = 
      Message
      .where(sender_id: current_user_id)
      .or(
        Message.where(reciever_id: current_user_id)
      )
      .order(created_at: :desc)
      .includes([:sender, :reciever])
    
    messages.map { |message| 
      if message.sender.id == current_user_id
        { user: message.reciever, company: message.reciever.company }
      else
        { user: message.sender, company: message.sender.company }
      end
    }.uniq
  end
end
