# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do # rubocop:disable Metrics/BlockLength
  subject do
    Event.new(
      title: 'Some Title',
      slug: 'some-title',
      starting_at: Time.zone.today.next_week,
      finishing_at: Time.zone.today.next_week,
      status: :published,
      description: 'some description'
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

  it 'is invalid without a slug' do
    subject.slug = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:slug]).to include("can't be blank")
  end

  it 'is invalid with duplicate slugs' do
    subject.save
    duplicate = subject.dup
    duplicate.description = 'some description'

    expect(duplicate.valid?).to be false
    expect(duplicate.errors[:slug]).to include('has already been taken')
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
    expect(subject.errors[:is_featured]).to include('must be true or false')
  end

  it 'is_featured defaults to false' do
    expect(subject.is_featured).to eq(false)
  end

  describe '#session_types_with_counts' do
    let!(:event) { FactoryBot.create(:event) }
    let!(:worship) { FactoryBot.create(:session_type, name: 'Worship') }
    let!(:plenary) { FactoryBot.create(:session_type, name: 'Plenary') }
    let!(:session1) { FactoryBot.create(:session, title: 'Worship 1', session_type: worship, event: event) }
    let!(:session2) { FactoryBot.create(:session, title: 'Worship 2', session_type: worship, event: event) }
    let!(:session3) { FactoryBot.create(:session, title: 'Plenary 1', session_type: plenary, event: event) }

    it 'returns correct number of session types' do
      expect(event.session_types_with_counts.length).to eq(2)
    end

    it 'includes the counts' do
      expect(event.session_types_with_counts.first.count).to eq(1)
      expect(event.session_types_with_counts.last.count).to eq(2)
    end

    it 'returns the types in alphabetical order' do
      expect(event.session_types_with_counts.first.name).to eq('Plenary')
      expect(event.session_types_with_counts.last.name).to eq('Worship')
    end
  end

  describe 'scopes: ' do # rubocop:disable Metrics/BlockLength
    context 'featured' do
      let!(:featured_event) { FactoryBot.create(:event, is_featured: true) }
      let!(:not_featured_event) { FactoryBot.create(:event, is_featured: false) }

      it 'only returns one event' do
        expect(Event.featured.count).to eq(1)
      end
    end

    context 'future' do
      let!(:future_event) { FactoryBot.create(:event, starting_at: Time.zone.today.next_week) }
      let!(:past_event) { FactoryBot.create(:event, starting_at: Time.zone.today.last_week) }

      it 'only returns one event' do
        expect(Event.future.count).to eq(1)
      end
    end

    context 'published' do
      let!(:published_event) { FactoryBot.create(:event, status: :published) }
      let!(:not_published_event) { FactoryBot.create(:event, status: :draft) }

      it 'only returns one event' do
        expect(Event.published.count).to eq(1)
      end
    end

    context 'past' do
      let!(:future_event) { FactoryBot.create(:event, starting_at: Time.zone.today.next_week) }
      let!(:past_event) { FactoryBot.create(:event, finishing_at: Time.zone.today.last_week) }

      it 'only returns one event' do
        expect(Event.past.count).to eq(1)
      end
    end
  end
end
