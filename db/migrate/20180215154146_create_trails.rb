class CreateTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :nearest_city
      t.string :directions
      t.float :distance
      t.text :description
      t.boolean :dog_friendly
      t.boolean :user_submitted
      t.timestamps
    end
  end
end
