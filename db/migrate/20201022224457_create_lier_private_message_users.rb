class CreateLierPrivateMessageUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :lier_private_message_users do |t|
      t.references :user, index: true
      t.references :private_message, index: true
      
      
      
    end
    add_reference :private_messages, :sender, index: true
  end
end
