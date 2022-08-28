class CreateSessionTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :session_types do |t|
      t.string :name, null: false
      t.string :description
      t.integer :order_by, default: 10

      t.timestamps
    end
    add_index :session_types, :name, unique: true
  end
end
