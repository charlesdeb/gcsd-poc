require 'rails_helper'

RSpec.describe "admin/events/show", type: :view do
  before(:each) do
    @event = assign(:admin_event, Event.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
