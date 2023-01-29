# Adds a few extra constraints that got missed first time round
class TweakSomeTables < ActiveRecord::Migration[7.0]
  def up
    # events
    change_column_null :events, :slug, false

    # pages
    change_column_null :pages, :slug, false

    # presenters
    change_column_null :presenters, :name, false
  end

  def down
    # events
    change_column_null :events, :slug, true

    # pages
    change_column_null :pages, :slug, true

    # presenters
    change_column_null :presenters, :name, true
  end
end
