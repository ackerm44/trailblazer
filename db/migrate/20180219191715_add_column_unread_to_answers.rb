class AddColumnUnreadToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :unread, :boolean, :default => true
  end
end
