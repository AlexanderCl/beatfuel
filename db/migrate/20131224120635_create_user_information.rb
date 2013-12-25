class CreateUserInformation < ActiveRecord::Migration
  def change
    create_table :user_informations do |t|
      t.integer :user_id
      t.string :slogan
      t.string :music_genre
      t.text :about
    end
  end
end
