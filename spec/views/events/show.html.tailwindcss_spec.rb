# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event,
                    Event.create!(
                      title: 'Title',
                      slug: 'slug-1',
                      status: 'Status',
                      description: 'MyText',
                      starting_at: Date.today.next_week,
                      finishing_at: Date.today.next_week
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
