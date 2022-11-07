# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  let(:starting_at) { DateTime.now.utc }
  before(:each) do
    @event = assign(:event,
                    Event.create!(
                      title: 'Title',
                      slug: 'slug-1',
                      status: 'Status',
                      description: 'MyText',
                      starting_at: starting_at,
                      finishing_at: DateTime.now.next_day
                    ))
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to include(I18n.l(starting_at, format: :short))
  end
end
