# frozen_string_literal: true

# temmporary join model used for migrating data
class SessionsTimeSlot < ApplicationRecord
  belongs_to :session
  belongs_to :time_slot
end
