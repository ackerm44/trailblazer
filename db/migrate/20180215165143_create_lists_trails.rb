class CreateListsTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :lists_trails , id: false do |t|
      t.belongs_to :list, index: true
      t.belongs_to :trail, index: true
    end
  end
end
