class CreatePresenters < ActiveRecord::Migration[7.0]
  def change
    create_table :presenters do |t|
      t.string :name

      t.timestamps
    end
    add_index :presenters, :name
  end
end
