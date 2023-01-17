# frozen_string_literal: true

module TestSupport
  # from sustainable web development with Rails
  module WithClues
    # Wrap any assertion with this method to get more useful context and
    # diagnostics when a system test is unexpectedly failing
    #
    # with_clues { expect(1).to eq(2) }

    def with_clues(&block)
      block.call
    rescue Exception => e # rubocop:disable Lint/RescueException
      puts "[ with_clues ] Test failed: #{e.message}"
      puts '[ with_clues ] HTML {'
      puts
      puts page.html
      puts
      puts '[ with_clues ] } END HTML'
      raise e
    end
  end
end
