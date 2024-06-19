# frozen_string_literal: true

# Controller for showing custom erroor pages
class ErrorsController < ApplicationController
  layout 'error'

  # generic error page displayer
  def show
    @exception = request.env['action_dispatch.exception']
    @status_code = @exception.try(:status_code) ||
                   ActionDispatch::ExceptionWrapper.new(
                     request.env, @exception
                   ).status_code

    render view_for_code(@status_code), status: @status_code
  end

  # triggered by non-friendly ID 404 errors from the pages controller
  def not_found
    render status: 404
  end

  # triggered
  def internal_server_error
    render status: 500
  end

  private

  def view_for_code(code)
    supported_error_codes.fetch(code, '404')
  end

  def supported_error_codes
    {
      # 403 => '403',
      # 404 => '404',
      404 => 'not_found',
      # 500 => '500'
      500 => 'internal_server_error'
    }
  end
end
