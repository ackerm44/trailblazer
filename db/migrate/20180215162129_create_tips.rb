class CreateTips < ActiveRecord::Migration[5.1]
  def change
    create_table :tips do |t|
      t.string :comment
      t.integer :user_id
      t.integer :trail_id
      t.timestamps
    end
  end
end
