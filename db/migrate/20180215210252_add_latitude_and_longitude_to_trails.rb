class AddLatitudeAndLongitudeToTrails < ActiveRecord::Migration[5.1]
  def change
    add_column :trails, :latitude, :float
    add_column :trails, :longitude, :float
  end
end
