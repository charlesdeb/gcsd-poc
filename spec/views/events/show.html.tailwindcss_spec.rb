# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  let(:starting_at) { Time.zone.now }
  before(:each) do
    @event = assign(:event,
                    Event.create!(
                      title: 'Title',
                      slug: 'slug-1',
                      status: 'Status',
                      description: 'MyText',
                      starting_at: starting_at,
                      finishing_at: Time.zone.now.next_day
                    ))
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
