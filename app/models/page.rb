# frozen_string_literal: true

# a (static) page
class Page < ApplicationRecord
  extend Mobility

  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true

  translates :body, backend: :action_text
  translates :title, backend: :action_text, plain: true, fallbacks: { fr: :en }
  translates :meta_description, backend: :action_text, plain: true

  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb,
                       { resize_to_limit: [50, 50], convert: :webp,
                         saver: { subsample_mode: 'on', strip: true, interlace: true, quality: 80 } }
  end
end
