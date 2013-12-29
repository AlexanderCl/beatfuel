class AddProfileIdToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :profile_id, :integer
  end
end
