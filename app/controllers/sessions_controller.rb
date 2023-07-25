# frozen_string_literal: true

# public controller for sessions
class SessionsController < ApplicationController
  before_action :set_session, only: %i[show]

  # GET /sessions/sessions/by_time_slot/:time_slot
  def index
    if params[:time_slot].blank?
      redirect_to root_path
    else
      @time_slot = TimeSlot.find(params[:time_slot])
      # Bullet recommended adding all these includes, but it actually
      # slows things down
      @sessions = Session.joins(:time_slots)
                         .where(time_slots: { id: params[:time_slot] })
      #  .includes([{ featured_image_attachment: :blob },
      #             :plain_text_translations, :presenters,
      #             :time_slots, :event])

      # respond_to do |format|
      #   format.html { redirect_to root_path } # bogus for now
      #   format.turbo_stream
      # end
    end
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
