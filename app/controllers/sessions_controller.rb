# frozen_string_literal: true

# public controller for sessions
class SessionsController < ApplicationController
  before_action :set_session, only: %i[show]

  # GET /sessions/by_time_slot/:time_slot
  # GET /sessions/by_event/:event/by_type/:session_type
  def index
    # if params[:time_slot].blank? && params[:event_id].blank? && params[:session_type_id].blank?
    #   redirect_to root_path

    result = SessionsLister.new.list_sessions(params)

    # if result.invalid_params?
    #   redirect_to root_path
    # else
      @sessions = result.sessions
      @turbo_frame_id = result.turbo_frame_id
    # end
    # where_clause = if params[:time_slot].blank?
    #                  { event_id: params[:event],
    #                    session_type_id: params[:session_type] }
    #                else
    #                  { time_slots: { id: params[:time_slot] } }
    #                end

    # # @time_slot = TimeSlot.find(params[:time_slot])
    # # Bullet recommended adding all these includes, but it actually
    # # slows things down
    # @sessions = Session.joins(:time_slots)
    #                    .where(where_clause)
    # #  .includes([{ featured_image_attachment: :blob },
    # #             :plain_text_translations, :presenters,
    # #             :time_slots, :event])
  end

  # GET /sessions/1 or /sessions/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # def session_params
  #   params.require(:session).permit(:title, :starting_at, :status, :description, :is_featured)
  # end
end
