# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do # rubocop:disable Metrics/BlockLength
  describe '#language_select' do # rubocop:disable Metrics/BlockLength
    let(:available_locales) { %i[en tr fr] }
    let(:locale) { :tr }

    context 'no locale provided in path' do
      let(:request_path) { '/' }

      subject { helper.language_select(request_path, available_locales, locale) }
      it 'contains a select tag' do
        expect(subject).to include('<select')
      end

      it 'contains a selected option of default locale' do
        expect(subject).to include('<option data-url="/tr" selected="selected"')
      end
    end

    context 'locale provided in path' do
      let(:request_path) { '/en' }
      let(:locale) { :en }

      subject { helper.language_select(request_path, available_locales, locale) }

      it 'contains a selected option with locale from path' do
        expect(subject).to include('<option data-url="/en" selected="selected"')
      end
    end

    it 'locale defaults to I18n.locale' do
      request_path = '/'
      allow(I18n).to receive(:locale) { :fr }

      expect(helper.language_select(
               request_path,
               available_locales
             )).to include('<option data-url="/fr" selected="selected"')
    end
  end
end
