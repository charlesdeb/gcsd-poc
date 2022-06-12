# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
                              title: 'Title',
                              status: 'Status',
                              description: 'MyText',
                              is_featured: false
                            ))
  end

  it 'renders attributes in <p>' do
    pending 'build real show view'
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
