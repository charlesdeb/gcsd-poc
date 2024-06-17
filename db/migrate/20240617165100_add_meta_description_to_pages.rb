class AddMetaDescriptionToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :meta_description, :text

    change_column_comment(:pages, :meta_description, from: '', to: 'SEO-friendly meta info for the page')
  end
end
