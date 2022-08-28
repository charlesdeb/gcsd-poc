# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, :slug, :starting_at, :finishing_at, :status, :description, presence: true
  validates :slug, uniqueness: true

  validates :is_featured, inclusion: {
    in: [true, false],
    message: 'must be true or false'
  }

  has_rich_text :description

  has_one_attached :featured_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  scope :featured, -> { where(is_featured: true) }
  scope :future, -> { where('starting_at >= ?', Date.today) }
  scope :past, -> { where('finishing_at < ?', Date.today) }
  scope :published, -> { where(status: :published) }
end
