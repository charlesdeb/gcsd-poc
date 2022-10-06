# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do # rubocop:disable Metrics/BlockLength
  describe '#language_select' do
    before(:each) do
      allow(I18n).to receive(:available_locales) { %i[en tr fr] }
    end
    let(:locale) { :tr }

    it 'contains a select tag' do
      expect(helper.language_select).to include('<select')
    end

    context 'no locale provided in path' do
      let(:request_path) { '/' }

      before(:each) do
        allow(I18n).to receive(:locale) { :tr }
      end

      subject { helper.language_select(request_path) }

      it 'contains a selected option of default locale' do
        expect(subject).to include('<option data-url="/tr" selected="selected"')
      end
    end

    context 'locale provided in path' do
      let(:request_path) { '/fr' }

      subject { helper.language_select(request_path) }

      it 'contains a selected option with locale from path' do
        expect(subject).to include('<option data-url="/fr" selected="selected"')
      end
    end
  end
end
