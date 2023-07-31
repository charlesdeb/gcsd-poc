# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsLister do
  include ActionView::RecordIdentifier

  let!(:session_type1) { FactoryBot.create(:session_type) }
  let!(:session_type2) { FactoryBot.create(:session_type) }

  let!(:event) { FactoryBot.create(:published_event) }

  let!(:time_slot1) { FactoryBot.create(:time_slot, event: event) }
  let!(:time_slot2) { FactoryBot.create(:time_slot, event: event) }

  # create 4 sessions - 2 in time_slot1, 2 for time_slot2, 3 of session_type1
  let!(:session1) do
    FactoryBot.create(:session, event: event, time_slots: [time_slot1, time_slot2], session_type: session_type1)
  end
  let!(:session2) { FactoryBot.create(:session, event: event, time_slots: [time_slot1], session_type: session_type1) }
  let!(:session3) { FactoryBot.create(:session, event: event, time_slots: [time_slot2], session_type: session_type1) }
  let!(:session4) { FactoryBot.create(:session, event: event, session_type: session_type2) }

  context 'for time_slot' do
    let(:params) { { time_slot: time_slot1.id } }
    let(:result) { SessionsLister.new.list_sessions(params) }

    it 'has correct sessions' do
      expect(result.sessions.count).to eq(2)
    end

    it 'turbo_frame_id is set' do
      expect(result.turbo_frame_id).to eq(dom_id(time_slot1))
    end
  end

  context 'for session_type' do
    let(:params) { { event: event.id, session_type: session_type1.id } }
    let(:result) { SessionsLister.new.list_sessions(params) }

    it 'has correct sessions' do
      expect(result.sessions.count).to eq(3)
    end

    it 'turbo_frame_id is set' do
      expect(result.turbo_frame_id).to eq(dom_id(session_type1))
    end
  end
end
