class ChangeStartAndFinishDatesInEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :starting_at, :datetime
    remove_column :events, :finishing_at
    add_column :events, :finishing_at, :datetime
  end
end
