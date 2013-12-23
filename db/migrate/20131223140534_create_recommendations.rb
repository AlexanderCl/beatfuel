class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :amount
    end
  end
end
