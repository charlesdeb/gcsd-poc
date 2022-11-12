require 'rails_helper'

# Not sure if we need to build out these tests. Feature tests do most of this
RSpec.describe 'pages/home', type: :view do # rubocop:disable Metrics/BlockLength
  let(:title) { 'Groovy Event' }
  before(:each) do
    assign(:page, FactoryBot.create(:page))
  end

  it 'shows the featured image if set'
  it 'handles a missing featured image'

  context 'there are no future events' do
    it 'shows no link for future events' do
      assign(:future_events, [])
      assign(:past_events, [])

      render

      expect(rendered).not_to match(/Coming Events/)
    end
  end

  context 'there are future events' do
    it 'shows link for future events' do
      assign(:future_events, [
               FactoryBot.create(:event, starting_at: Time.zone.today.next_week, title: title),
               FactoryBot.create(:event, starting_at: Time.zone.today.tomorrow, title: title)
             ])
      assign(:past_events, [])

      render

      expect(rendered).to have_link 'Coming Events', href: future_events_path
    end
  end

  context 'there are past events' do
    it 'shows link for past events'
  end
end
