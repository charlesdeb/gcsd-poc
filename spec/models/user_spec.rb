# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      email: 'bob@example.com',
      password: '123456',
      first_name: 'Bob'
      # locale: :en          # not needed since the DB specifies this
      # time_zone: 'London'  # not needed since the DB specifies this
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without an email' do
    subject.email = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    subject.password = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:password]).to include("can't be blank")
  end

  it 'is invalid without either a first_name or last_name' do
    subject.first_name = nil

    expect(subject.valid?).to be false
    expect(subject.errors.full_messages).to include("First name and last name can't both be blank")
  end

  it 'is invalid without locale' do
    subject.locale = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:locale]).to include("can't be blank")
  end

  it 'is invalid without time_zone' do
    subject.time_zone = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:time_zone]).to include("can't be blank")
  end

  it "has 'user' role by default" do
    expect(subject.role.to_sym).to eq(:user)
  end

  describe '.initials' do
    let(:user) { FactoryBot.build(:user, first_name: 'Bob', last_name: 'Smith') }

    it 'handles initials when two names' do
      expect(user.initials).to eq('BS')
    end

    it 'handles initials when first name only' do
      user.last_name = nil
      expect(user.initials).to eq('B')
    end

    it 'handles initials when last name only' do
      user.first_name = nil
      expect(user.initials).to eq('S')
    end
  end
end
