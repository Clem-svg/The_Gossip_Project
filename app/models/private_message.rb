class PrivateMessage < ApplicationRecord
  has_many :LierPrivateMessageUsers
  has_many :receivers,through: :LierPrivateMessageUsers,source: :user
  belongs_to :sender, class_name: "User"
  

end
