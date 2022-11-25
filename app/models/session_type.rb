# frozen_string_literal: true

class SessionType < ApplicationRecord
  validates :name, :order_by, presence: true
end
