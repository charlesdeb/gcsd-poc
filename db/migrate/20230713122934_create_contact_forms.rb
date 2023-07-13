class CreateContactForms < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_forms do |t|
      t.text :first_name, null: false
      t.text :last_name, null: false
      t.text :email, null: false
      t.text :message, null: false

      t.timestamps
    end

    add_index :contact_forms, :first_name
    add_index :contact_forms, :last_name
    add_index :contact_forms, :email
  end
end
