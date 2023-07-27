# frozen_string_literal: true

# lists sessions
class SessionsLister
  def list_sessions(params)
    if params[:time_slot].blank?
      where_clause = { event_id: params[:event],
                       session_type_id: params[:session_type] }
      turbo_frame_id = 'session_type_summaries'
    else
      where_clause = { time_slots: { id: params[:time_slot] } }
      turbo_frame_id = 'timetable_time_slot_summaries'
    end

    # @time_slot = TimeSlot.find(params[:time_slot])
    # Bullet recommended adding all these includes, but it actually
    # slows things down
    sessions = Session.joins(:time_slots)
                      .where(where_clause)
                      .includes([{ featured_image_attachment: :blob },
                                 :plain_text_translations, :presenters,
                                 :time_slots, :event])

    Result.new(sessions: sessions, turbo_frame_id: turbo_frame_id)
  end

  private

  def foo; end

  class Result
    attr_reader :sessions, :turbo_frame_id, :invalid_params

    # def initialize(sessions:, turbo_frame_id:, invalid_params:)
    def initialize(sessions:, turbo_frame_id:)
      @sessions = sessions
      @turbo_frame_id = turbo_frame_id
      # @invalid_params = invalid_params
    end

    # def invalid_params?
    #   @invalid_params
    # end
  end
end
