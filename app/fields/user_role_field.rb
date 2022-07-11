require "administrate/field/base"

class UserRoleField < Administrate::Field::Base
  def to_s
    data.titleize
  end
end
