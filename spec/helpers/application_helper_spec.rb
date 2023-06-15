# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe '#locale_select' do
    before(:each) do
      allow(I18n).to receive(:available_locales) { %i[en fr] }
    end
    let(:locale) { :fr }

    it 'contains a select tag' do
      expect(helper.locale_select).to include('<select')
    end

    context 'no locale provided in path' do
      let(:request_path) { '/' }

      before(:each) do
        allow(I18n).to receive(:locale) { :fr }
      end

      subject { helper.locale_select(request_path) }

      it 'contains a selected option of default locale' do
        expect(subject).to include('<option data-url="/fr" selected="selected"')
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
      expect(helper.timezone_select).to include('<option value="UTC+0"')
      expect(helper.timezone_select).to include('<option value="Europe/London"')
      expect(helper.timezone_select).to include('<option value="Europe/Paris"')
      expect(helper.timezone_select).to include('<option value="Europe/Bucharest"')
      expect(helper.timezone_select).to include('<option value="Asia/Almaty"')
      expect(helper.timezone_select).to include('<option value="Asia/Singapore"')
      expect(helper.timezone_select).to include('<option value="Australia/Sydney"')
      expect(helper.timezone_select).to include('<option value="Pacific/Auckland"')
      expect(helper.timezone_select).to include('<option value="America/New_York"')
      expect(helper.timezone_select).to include('<option value="America/Vancouver"')
    end
  end

  describe '#session_type_tab' do
    let(:event) { create(:published_event_with_image_and_sessions) }
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
        p subject
        expect(subject).to include('text-orange-500')
        expect(subject).to include('hover:text-orange-700')
      end
    end
  end

  describe '#wide_main_menu_item_class' do
    it 'includes \'active\' when menu_item is the same as the active_menu_item' do
      subject = helper.wide_main_menu_item_class :foo, :foo

      expect(subject).to include('active')
    end

    it 'does not include \'active\' when menu_item is not the same as the active_menu_item' do
      subject = helper.wide_main_menu_item_class :foo, :bar

      expect(subject).not_to include('active')
    end
  end
end
