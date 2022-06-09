class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|

      t.timestamps
    end
    add_reference :favourites, :profiles, null: true, foreign_key: true
    add_reference :favourites, :user, null: false, foreign_key: true
    rename_column :favourites, :profiles_id, :profile_id
  end
end
