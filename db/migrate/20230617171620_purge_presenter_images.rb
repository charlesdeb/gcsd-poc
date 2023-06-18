class PurgePresenterImages < ActiveRecord::Migration[7.0]
  def up
    # don't try and run this if the Presenter model doesn't
    # have featured_image attached to it
    return unless Presenter.first.respond_to?(:featured_image)

    Presenter.all.each do |p|
      p.featured_image.purge if p.featured_image.attached?
    end
  end

  def down
    # no way to undo this!
  end
end
