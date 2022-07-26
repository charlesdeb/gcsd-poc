# frozen_string_literal: true

# Users of the GCSD application
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validate :need_a_name

  # for i18n, check out https://github.com/shlima/translate_enum
  enum role: { user: 0, attender: 1, admin: 2 }

  has_one_attached :profile_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def need_a_name
    return if first_name.present? || last_name.present?

    errors.add :base, :invalid,
               message: "First name and last name can't both be blank"
  end

  def initials
    "#{first_name.first.upcase}#{last_name.first.upcase}".strip
  end
end
