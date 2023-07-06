# frozen_string_literal: true

# Some commonly called test helpers
module Helpers
  # confirms a user - although this is usually done in the user factory
  def confirm(user)
    user.confirm
    user.save
  end
end
