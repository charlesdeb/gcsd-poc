# frozen_string_literal: true

require 'rails_helper'

# see https://guides.rubyonrails.org/testing.html#rspec
RSpec.describe 'Zeitwerk compliance' do
  it 'eager loads all files without errors' do
    expect { Rails.application.eager_load! }.not_to raise_error
  end
end
