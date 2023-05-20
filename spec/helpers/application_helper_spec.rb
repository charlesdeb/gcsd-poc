# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe '#locale_select' do
    before(:each) do
      allow(I18n).to receive(:available_locales) { %i[en tr fr] }
    end
    let(:locale) { :tr }

    it 'contains a select tag' do
      expect(helper.locale_select).to include('<select')
    end

    context 'no locale provided in path' do
      let(:request_path) { '/' }

      before(:each) do
        allow(I18n).to receive(:locale) { :tr }
      end

      subject { helper.locale_select(request_path) }

      it 'contains a selected option of default locale' do
        expect(subject).to include('<option data-url="/tr" selected="selected"')
      end
    end

    context 'locale provided in path' do
      let(:request_path) { '/fr' }

      subject { helper.locale_select(request_path) }

      it 'contains a selected option with locale from path' do
        expect(subject).to include('<option data-url="/fr" selected="selected"')
      end
    end
  end

  describe '#timezone_select' do
    it 'contains a select tag' do
      expect(helper.timezone_select).to include('<select')
    end

    it 'contains given timezones' do
      expect(helper.timezone_select).to include('<option value="Europe/London"')
      expect(helper.timezone_select).to include('<option value="Europe/Paris"')
      expect(helper.timezone_select).to include('<option value="Europe/Berlin"')
      expect(helper.timezone_select).to include('<option value="Asia/Singapore"')
      expect(helper.timezone_select).to include('<option value="Australia/Sydney"')
      expect(helper.timezone_select).to include('<option value="Pacific/Auckland"')
    end
  end

  describe '#session_type_tab' do
    let(:event) { create(:event_with_image_and_sessions) }
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
