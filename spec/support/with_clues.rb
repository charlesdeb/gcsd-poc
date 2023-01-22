# frozen_string_literal: true

module TestSupport
  # from sustainable web development with Rails
  module WithClues
    # Wrap any assertion with this method to get more useful context and
    # diagnostics when a system test is unexpectedly failing
    #
    # with_clues { expect(1).to eq(2) }

    def with_clues(&block) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/PerceivedComplexity
      block.call
    rescue Exception => e # rubocop:disable Lint/RescueException
      puts "[ with_clues ] Test failed: #{e.message}"
      if page.driver.respond_to?(:browser)
        if page.driver.browser.respond_to?(:manage)
          if page.driver.browser.manage.respond_to?(:logs) # rubocop:disable Metrics/BlockNesting
            logs = page.driver.browser.manage.logs
            browser_logs = logs.get(:browser)
            browser_logs.each do |log|
              puts log.message
            end
            puts '[ with_clues ] } END Browser Logs'
          else
            puts "[ with_clues ] NO BROWSER LOGS: page.driver.browser.manage #{page.driver.browser.manage.class} does not respond to #logs" # rubocop:disable Layout/LineLength
          end
        else
          puts "[ with_clues ] NO BROWSER LOGS: page.driver.browser #{page.driver.browser.class} does not respond to #manage" # rubocop:disable Layout/LineLength
        end
      else
        puts "[ with_clues ] NO BROWSER LOGS: page.driver #{page.driver.class} does not respond to #browser"
      end
      puts
      puts '[ with_clues ] HTML {'
      puts
      puts page.html
      puts
      puts '[ with_clues ] } END HTML'
      raise e
    end
  end
end
