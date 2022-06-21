# frozen_string_literal: true

# admin controller for events
class Admin::EventsController < ApplicationController
  before_action :set_admin_event, only: %i[show edit update destroy]

  # GET /admin/events or /admin/events.json
  def index
    @events = Event.all
  end

  # GET /admin/events/1 or /admin/events/1.json
  def show; end

  # GET /admin/events/new
  def new
    @event = Event.new
  end

  # GET /admin/events/1/edit
  def edit; end

  # POST /admin/events or /admin/events.json
  def create
    @event = Admin::Event.new(admin_event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_event_url(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/events/1 or /admin/events/1.json
  def update
    respond_to do |format|
      if @event.update(admin_event_params)
        format.html { redirect_to admin_event_url(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/events/1 or /admin/events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_event_params
    params.fetch(:admin_event, {})
  end
end
