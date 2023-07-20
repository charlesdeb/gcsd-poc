# frozen_string_literal: true

# People that present sessions. May be a candidate for STI or polymorphic
# stuff later
class Presenter < ApplicationRecord
  extend Mobility
  include ActiveModel::Serialization

  has_rich_text :bio

  # will not be used unless we show a library of presenters
  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  has_and_belongs_to_many :sessions

  translates :bio, backend: :action_text

  validates :name, presence: true

  default_scope { i18n }
end
