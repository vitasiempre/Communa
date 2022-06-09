class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :name
      t.boolean :visibility
      t.string :photo
      t.integer :age
      t.string :gender
      t.string :destination_city
      t.integer :tidiness
      t.integer :partyness
      t.string :time_at_home
      t.text :description
      t.string :interests
      t.string :work_field
      t.boolean :queer_friendly
      t.text :recycle
      t.boolean :smoking
      t.string :diet
      t.integer :daily_regime
      t.integer :communicativeness
      t.string :instagram_link
      t.string :vk_link
      t.string :facebook_link
      t.string :avatar

      t.timestamps
    end
    add_reference :users, :profile, null: true, foreign_key: true
  end
end
