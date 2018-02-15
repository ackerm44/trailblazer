class CreateTrailsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :trails_users , id: false do |t|
      t.belongs_to :trail, index: true
      t.belongs_to :user, index: true
    end
  end
end
