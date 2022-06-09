class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body

      t.timestamps
    end
    add_reference :messages, :user, null: false, foreign_key: true
    add_reference :messages, :chat, null: false, foreign_key: true
  end
end
