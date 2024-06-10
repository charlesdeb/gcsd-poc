# frozen_string_literal: true

# ensure we use HTTP authentication in production
# code taken from
# https://medium.com/weareevermore/how-to-add-http-basic-authentication-to-your-rails-application-e4e4d5b958d9
module HttpAuthConcern
  extend ActiveSupport::Concern

  included do
    before_action :http_authenticate
  end

  def http_authenticate
    # Check ENV variable to see whether to use Http Auth
    return true unless ENV.fetch('USE_HTTP_AUTH', nil) == 'true'

    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_USERNAME'] && password == ENV['HTTP_PASSWORD']
    end
  end
end
