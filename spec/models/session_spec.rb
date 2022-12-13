# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session, type: :model do # rubocop:disable Metrics/BlockLength
  let(:event) { create(:event) }
  let(:session_type) { create(:session_type) }
  let(:time_slot) { create(:time_slot) }

  subject do
    Session.new(
      title: 'Some Title',
      description: 'some-description',
      event_id: event.id,
      session_type_id: session_type.id,
      time_slot_id: time_slot.id
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
end
