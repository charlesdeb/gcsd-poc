# frozen_string_literal: true

class SessionType < ApplicationRecord
  extend Mobility

  validates :name, :order_by, presence: true

  # None of these uniqueness constraints appears to work. They all seem to
  # expect a name (or name_xx) column in the table
  # I18n.available_locales.each do |locale|
  #   validates :"name_#{locale}", uniqueness: true
  # end
  # validates_uniqueness_of :name
  # validates :name, uniqueness: true

  translates :name, backend: :action_text, plain: true
  translates :description, backend: :action_text, plain: true

  has_many :sessions

  default_scope { i18n }
end
