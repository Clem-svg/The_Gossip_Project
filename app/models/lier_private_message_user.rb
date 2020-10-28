class LierPrivateMessageUser < ApplicationRecord
  belongs_to :user
  belongs_to :private_message

  validates :content, presence: true
end
