# frozen_string_literal: true

# from https://mikerogers.io/2019/11/05/how-to-test-factory-bot-factories-with-rspec
# and https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#linting-factories

require 'rails_helper'

RSpec.describe FactoryBot do
  # ensure that my factories are valid by linting them
  it 'has factories set up properly' do
    FactoryBot.lint(traits: true)
  end
end
