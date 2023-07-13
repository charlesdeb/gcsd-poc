# frozen_string_literal: true

# a user entered record from the contact form
# these should all be emailed in, but sometimes email breaks...
class ContactForm < ApplicationRecord
  validates :first_name, :last_name, :email, :message, presence: true
end
