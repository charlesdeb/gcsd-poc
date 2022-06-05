# frozen_string_literal: true

class Page < ApplicationRecord
  validates :title, :slug, :body, presence: true
end
