class CreateChatListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_list_items do |t|

      t.timestamps
    end
    add_reference :chat_list_items, :user, foreign_key: true
    # # хз тут ↓
    add_reference :chat_list_items, :chat, foreign_key: true
  end
end
