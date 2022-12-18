# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Presenter, type: :model do
  subject do
    Presenter.new(
      name: 'John'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without a name' do
    subject.name = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:name]).to include("can't be blank")
  end
end
