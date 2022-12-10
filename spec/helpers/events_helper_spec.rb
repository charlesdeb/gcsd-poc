# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
  let(:event) { create(:event_with_sessions) }

  describe 'session_type_tab' do
    context 'first tab' do
      subject do
        helper.session_type_tab event.session_types_with_counts.first, 0
      end

      # TODO: seems like a very fragile test...
      it 'is selected' do
        expect(subject).to include('text-orange-900')
      end
    end

    context 'other tabs' do
      subject do
        helper.session_type_tab event.session_types_with_counts.first, 1
      end

      # TODO: seems like a very fragile test...
      it 'is not selected' do
        expect(subject).to include('text-orange-500')
        expect(subject).to include('hover:text-orange-700')
      end
    end
  end
end
