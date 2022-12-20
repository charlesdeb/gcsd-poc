class CreateSessionsAndPresenters < ActiveRecord::Migration[7.0]
  def change
    create_join_table :sessions, :presenters do |t|
      t.index :session_id
      t.index :presenter_id
    end

    add_index :presenters_sessions, %i[session_id presenter_id], unique: true
  end
end
