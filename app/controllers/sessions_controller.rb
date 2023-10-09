# frozen_string_literal: true

# public controller for sessions
class SessionsController < ApplicationController
  before_action :set_session, only: %i[show]

  # GET /sessions/by_time_slot/:time_slot
  # GET /sessions/by_event/:event/by_type/:session_type
  def index
    result = SessionsLister.new.list_sessions(params)

    @sessions = result.sessions
    @turbo_frame_id = result.turbo_frame_id
  end

  # GET /sessions/1 or /sessions/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # def session_params
  #   params.require(:session).permit(:title, :starting_at, :status, :description, :is_featured)
  # end
end
