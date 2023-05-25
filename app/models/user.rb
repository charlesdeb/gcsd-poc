# frozen_string_literal: true

# Users of the GCSD application
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :locale, :time_zone, :role, presence: true
  validate :needs_a_name

  # for i18n, check out https://github.com/shlima/translate_enum
  enum role: { user: 0, attender: 1, admin: 2 }

  has_one_attached :profile_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  after_initialize :set_default_role, if: :new_record?

  # TODO: is this the right place for this? It's not an important domain concept.
  # It's currently only used for display - so it could be a helper
  # but it could be used for other things than display gojng forwards...
  def initials
    "#{first_name.present? ? first_name.first.upcase : nil}#{last_name.present? ? last_name.first.upcase : nil}"
  end

  private

  def set_default_role
    self.role ||= :user
  end

  def needs_a_name
    return if first_name.present? || last_name.present?

    errors.add :base, :invalid,
               message: "First name and last name can't both be blank"
  end
end
