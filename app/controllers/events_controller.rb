# frozen_string_literal: true

# public controller for events
# TODO: remove the update/delete actions
class EventsController < ApplicationController
  # before_action :set_event, only: %i[show edit update destroy]

  before_action { |c| c.update_active_menu_item(:events) }

  # GET /events, /past_events or /future_events
  def index
    # get future, past or all published events
    @events = case params[:scope]
              when 'future'
                Event.publicly_viewable.future
              when 'past'
                Event.publicly_viewable.past
              else
                Event.publicly_viewable
              end
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.friendly.find(params[:id])
    # The where clause is a hack that prevents events without a translation
    # from being displayed.
    # @event = Event.where.not(title: nil).friendly.find(params[:id])
  end

  # # GET /events/new
  # def new
  #   @event = Event.new
  # end

  # # GET /events/1/edit
  # def edit; end

  # # POST /events or /events.json
  # def create
  #   @event = Event.new(event_params)

  #   respond_to do |format|
  #     if @event.save
  #       format.html { redirect_to event_url(@event), notice: 'Event was successfully created.' }
  #       format.json { render :show, status: :created, location: @event }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /events/1 or /events/1.json
  # def update
  #   respond_to do |format|
  #     if @event.update(event_params)
  #       format.html { redirect_to event_url(@event), notice: 'Event was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @event }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /events/1 or /events/1.json
  # def destroy
  #   @event.destroy

  #   respond_to do |format|
  #     format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    # select an event by id or slug
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :starting_at, :status, :description, :is_featured)
  end
end
