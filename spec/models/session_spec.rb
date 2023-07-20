# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session, type: :model do
  let(:event) { create(:event) }
  let(:session_type) { create(:session_type) }
  let(:time_slot) { create(:time_slot) }

  subject do
    Session.new(
      title: 'Some Title',
      description: 'some-description',
      event_id: event.id,
      session_type_id: session_type.id
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

  it 'is invalid without a description' do
    subject.description = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without an event_id' do
    subject.event_id = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:event_id]).to include("can't be blank")
  end

  it 'is invalid without a session_type_id' do
    subject.session_type_id = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:session_type_id]).to include("can't be blank")
  end

  it 'is invalid if a time_slot is not for the event' do
    other_event = create(:event)
    other_time_slot = create(:time_slot, event: other_event)

    subject.time_slots = [other_time_slot]

    expect(subject.valid?).to be false
    expect(subject.errors[:base]).to include("Time Slot '#{other_time_slot.title}' is not for event '#{event.title}'")
  end
end
