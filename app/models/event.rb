# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, :starting_at, :status, :description, :is_featured, presence: true
end
