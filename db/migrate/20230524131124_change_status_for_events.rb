class ChangeStatusForEvents < ActiveRecord::Migration[7.0]
  def up
    add_column :events, :status_tmp, :integer, default: 0, null: false

    Event.reset_column_information # make the new column available to model methods

    Event.where("status ='draft'").update_all(status_tmp: 0)
    Event.where("status ='coming soon'").update_all(status_tmp: 1)
    Event.where("status ='published'").update_all(status_tmp: 2)
    Event.where("status ='archived'").update_all(status_tmp: 3)

    remove_column :events, :status
    rename_column :events, :status_tmp, :status

    change_column_comment(:events, :status, from: '', to: 'draft, coming_soon, published or archived')
  end

  def down
    add_column :events, :status_tmp, :text, default: 'draft', null: false

    Event.reset_column_information # make the new column available to model methods

    Event.where(status: 0).update_all(status_tmp: 'draft')
    Event.where(status: 1).update_all(status_tmp: 'coming soon')
    Event.where(status: 2).update_all(status_tmp: 'published')
    Event.where(status: 3).update_all(status_tmp: 'archived')

    remove_column :events, :status
    rename_column :events, :status_tmp, :status

    change_column_comment(:events, :status, from: '', to: 'published, draft etc...')
  end
end
