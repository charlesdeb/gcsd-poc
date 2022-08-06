# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/events/edit', type: :view do
  before(:each) do
    @event = assign(:event, create(:event))
  end

  it 'renders the edit admin_event form' do
    skip "we're using administrate ATM"
    render

    assert_select 'form[action=?][method=?]', admin_event_path(@event), 'post' do
    end
  end
end
