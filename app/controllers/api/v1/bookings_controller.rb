class Api::V1::BookingsController < ApplicationController
  before_action :set_api_v1_booking, only: [:show, :update, :destroy]
  respond_to :json
  # GET /api/v1/bookings
  def index
    @api_v1_bookings = Booking.all

    render json: @api_v1_bookings
  end

  # GET /api/v1/bookings/1
  def show
    render json: @api_v1_booking
  end


  # POST /api/v1/bookings
  def create
    @api_v1_booking = Booking.new(api_v1_booking_params)

    if @api_v1_booking.save
      respond_with :api, :v1, @api_v1_booking
      #render json: @api_v1_booking, status: :created, location: @api_v1_booking
    else
      respond_with :api, :v1, @api_v1_booking
      #render json: @api_v1_booking.errors, status: :unprocessable_entity
    end
  end

  def create_with_new_passenger
    # passenger existential assertion check
    @passenger_exists = false
    @passenger_params = {name: params.fetch(:name), email: params.fetch(:email), phone: params.fetch(:phone)}
    @this_passenger = Passenger.where(@passenger_params).limit(1)
    if @this_passenger.length == 0
      @this_passenger = Passenger.new(@passenger_params)
      if @this_passenger.save
        @passenger_exists = true
      end
    else 
      @passenger_exists = true
    end

    if @passenger_exists
      @api_v1_booking = Booking.new(passengers_id: @this_passenger.id, flightofferings_id: params.fetch(:flightofferings_id))
      @api_v1_booking.save
      respond_with :api, :v1, @api_v1_booking
    else
      respond_with :api, :v1, @this_passenger
    end
  end

  # PATCH/PUT /api/v1/bookings/1
  def update
    if @api_v1_booking.update(api_v1_booking_params)
      render json: @api_v1_booking
    else
      render json: @api_v1_booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/bookings/1
  def destroy
    @api_v1_booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_booking
      @api_v1_booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_booking_newpassenger_params
      params.permit(
        :name,
        :email,
        :phone,
        :flightofferings_id,
      )
    end
    def api_v1_booking_params
      params.permit(
        :flightofferings_id,
        :passengers_id,
      )
    end
end
