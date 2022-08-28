class SessionType < ApplicationRecord
    validates :name, :order_by, presence: true, uniqueness: true
end
