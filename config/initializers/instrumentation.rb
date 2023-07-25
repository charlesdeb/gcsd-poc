# frozen_string_literal: true

# https://guides.rubyonrails.org / active_support_instrumentation.html
ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)

  if event.payload[:controller] == 'EventsController'
    event.name # => "process_action.action_controller"
    event.duration  # => 10 (in milliseconds)
    event.payload   # => {:extra=>information}
    Rails.logger.info "#{event} Received!"
    Rails.logger.info "Name:               #{event.name}"
    Rails.logger.info "Controller:         #{event.payload[:controller]}"
    Rails.logger.info "Action:             #{event.payload[:action]}"
    Rails.logger.info "Total Duration(ms): #{event.duration}"
    Rails.logger.info "View Runtime(ms):   #{event.payload[:view_runtime]}"
    Rails.logger.info "DB Runtime(ms):     #{event.payload[:db_runtime]}"
    # Rails.logger.info "Payload:  #{event.payload}" # a large object, so don't show by default
  end
end
