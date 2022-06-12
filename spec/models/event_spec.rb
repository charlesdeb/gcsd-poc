# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do # rubocop:disable Metrics/BlockLength
  subject do
    Event.new(title: 'some title', starting_at: Date.today.next_week, status: :published, description: 'some description',
              is_featured: true)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without a title' do
    subject.title = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without starting_at' do
    subject.starting_at = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:starting_at]).to include("can't be blank")
  end

  it 'is invalid without a status' do
    subject.status = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:status]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    subject.description = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without is_featured' do
    subject.is_featured = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:is_featured]).to include("can't be blank")
  end
end
