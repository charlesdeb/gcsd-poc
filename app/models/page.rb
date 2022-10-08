# frozen_string_literal: true

class Page < ApplicationRecord
  extend Mobility

  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true

  translates :body, backend: :action_text
  translates :title, backend: :action_text, plain: true

  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end
end
