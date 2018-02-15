class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :user_id
      t.integer :trail_id
      t.timestamps
    end
  end
end
