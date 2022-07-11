# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validate :need_a_name

  def need_a_name
    return if first_name.present? || last_name.present?

    errors.add :base, :invalid,
               message: "First name and last name can't both be blank"
  end
end
