class AddPhotoToTrails < ActiveRecord::Migration[5.1]
  def change
    add_column :trails, :photo, :string
  end
end
