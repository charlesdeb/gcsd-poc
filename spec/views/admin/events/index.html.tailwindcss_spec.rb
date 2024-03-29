# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/events/index', type: :view do
  before(:each) do
    assign(:events, [
             Event.create!(
               title: 'Title',
               slug: 'slug-1',
               status: :draft,
               description: 'MyText',
               starting_at: Time.zone.today.next_week,
               finishing_at: Time.zone.today.next_week.days_since(1)
             ),
             Event.create!(
               title: 'Title',
               slug: 'slug-2',
               status: :coming_soon,
               description: 'MyText',
               starting_at: Time.zone.today.next_week,
               finishing_at: Time.zone.today.next_week.days_since(1)
             )
           ])
  end

  it 'renders a list of events' do
    skip "we're using administrate ATM"
    pending 'build the real index page'
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
