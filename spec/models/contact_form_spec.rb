require 'rails_helper'

RSpec.describe ContactForm, type: :model do
  subject do
    ContactForm.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      message: Faker::Lorem.sentence
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without a first_name' do
    subject.first_name = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:first_name]).to include("can't be blank")
  end

  it 'is invalid without a last_name' do
    subject.last_name = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:last_name]).to include("can't be blank")
  end

  it 'is invalid without a email' do
    subject.email = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a message' do
    subject.message = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:message]).to include("can't be blank")
  end
end
