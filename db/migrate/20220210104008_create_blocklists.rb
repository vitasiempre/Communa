class CreateBlocklists < ActiveRecord::Migration[6.1]
  def change
    create_table :blocklists do |t|
      t.string :type

      t.timestamps
    end
  end
end
