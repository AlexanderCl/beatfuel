class CreateMixtapes < ActiveRecord::Migration
  def change
    create_table :mixtapes do |t|
      t.string :title
      t.string :src
      t.timestamps
    end
  end
end
