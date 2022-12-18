# frozen_string_literal: true

# People that present sessions. May be a candidate for STI or polymorphic
# stuff later
class Presenter < ApplicationRecord
  include ActiveModel::Serialization

  has_rich_text :bio

  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  validates :name, presence: true
end
