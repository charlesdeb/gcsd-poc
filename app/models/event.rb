# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, :slug, :starting_at, :finishing_at, :status, :description, presence: true

  validates :is_featured, inclusion: {
    in: [true, false],
    message: 'must be true or false'
  }

  has_rich_text :description

  scope :featured, -> { where(is_featured: true) }
  scope :future, -> { where('starting_at >= ?', Date.today) }
  scope :published, -> { where(status: :published) }
end
