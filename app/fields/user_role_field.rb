# frozen_string_literal: true

require 'administrate/field/base'

# pretty up the enum value
class UserRoleField < Administrate::Field::Base
  def to_s
    data.titleize
  end
end
