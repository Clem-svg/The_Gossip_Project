class User < ApplicationRecord
  has_secure_password


  belongs_to :city

  has_many :LierPrivateMessageUsers
  has_many :received_messages,through: :LierPrivateMessageUsers, source: :private_message
  has_many :sent_messages, foreign_key: 'sender_id',class_name: "PrivateMessage"
  has_many :gossips
  has_many :favorites, dependent: :destroy

  validates :password, presence: true, length: {minimum: 6}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age, presence: true


end