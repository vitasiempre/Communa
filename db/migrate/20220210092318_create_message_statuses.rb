class CreateMessageStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :message_statuses do |t|
      t.boolean :status

      t.timestamps
    end
    add_reference :message_statuses, :message, null: false, foreign_key: true
    add_reference :message_statuses, :user, null: false, foreign_key: true
  end
end
