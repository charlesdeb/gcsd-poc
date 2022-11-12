# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/index', type: :view do # rubocop:disable Metrics/BlockLength
  before(:each) do
    assign(:events, [
             Event.create!(
               title: 'Title',
               slug: 'slug-1',
               status: 'Status',
               description: 'MyText',
               starting_at: Time.zone.today.next_week,
               finishing_at: Time.zone.today.next_week
             ),
             Event.create!(
               title: 'Title',
               slug: 'slug-2',
               status: 'Status',
               description: 'MyText',
               starting_at: Time.zone.today.next_week,
               finishing_at: Time.zone.today.next_week
             )
           ])
  end

  it 'renders a list of events' do
    pending 'build the real index page'
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
