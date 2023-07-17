# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TimeSlot, type: :model do
  let(:event) { create(:event) }
  let(:starting_at) { Time.zone.now.beginning_of_hour }

  subject do
    TimeSlot.new(
      title: 'some title',
      starting_at: starting_at,
      finishing_at: starting_at.advance(hours: 1),
      event_id: event.id
    )
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

  it 'is invalid without finishing_at' do
    subject.finishing_at = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:finishing_at]).to include("can't be blank")
  end

  it 'is invalid without event' do
    subject.event_id = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:event_id]).to include("can't be blank")
  end

  it 'is invalid with duplicate event and starting_at' do
    subject.save
    duplicate = subject.dup
    duplicate.title = 'something else'

    expect(duplicate.valid?).to be false
    expect(duplicate.errors[:starting_at]).to include('has already been defined for this event')
  end

  it 'is invalid with duplicate event and title' do
    subject.save
    duplicate = subject.dup
    duplicate.starting_at = Time.zone.now

    expect(duplicate.valid?).to be false
    expect(duplicate.errors[:title]).to include('has already been defined for this event')
  end

  it 'is invalid if finishing_at is before starting_at' do
    subject.finishing_at = subject.starting_at.advance(hours: -1)

    expect(subject.valid?).to be false
    expect(subject.errors[:finishing_at]).to include('must be after the start date')
  end

  describe '#duration_parts' do
    it 'returns length in minutes' do
      subject.finishing_at = subject.starting_at.advance(minutes: 45)

      expect(subject.duration_parts).to eq({ minutes: 45 })
    end

    it 'returns length in hours and minutes' do
      subject.finishing_at = subject.starting_at.advance(hours: 1, minutes: 45)

      expect(subject.duration_parts).to eq({ hours: 1, minutes: 45 })
    end
  end
end
