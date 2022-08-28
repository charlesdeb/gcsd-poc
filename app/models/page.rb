# frozen_string_literal: true

class Page < ApplicationRecord
  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true

  has_rich_text :body

  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end
end
