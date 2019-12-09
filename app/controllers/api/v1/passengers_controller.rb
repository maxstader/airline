class Api::V1::PassengersController < ApplicationController
  before_action :set_api_v1_passenger, only: [:show, :update, :destroy]
  respond_to :json
  # GET /api/v1/passengers
  def index
    @api_v1_passengers = Passenger.all

    render json: @api_v1_passengers
  end

  # GET /api/v1/passengers/show_all_with_flights
  def show_all_with_flights
    @passengers = []
    Passenger.find_each do |passenger|
      @booked_flights = Booking.where(passengers_id: passenger.id)
      @passenger_with_flights = {
        id: passenger.id,
        name: passenger.name,
        email: passenger.email,
        booked_flights: @booked_flights
      }
      @passengers.push(@passenger_with_flights)
    end
    render json: @passengers
  end

  # GET /api/v1/passengers/1
  def show
    render json: @api_v1_passenger
  end

  # POST /api/v1/passengers
  def create
    @api_v1_passenger = Passenger.new(api_v1_passenger_params)

    if @api_v1_passenger.save
      respond_with :api, :v1, @api_v1_passenger
    else
      respond_with :api, :v1, @api_v1_passenger
    end
  end

  # PATCH/PUT /api/v1/passengers/1
  def update
    if @api_v1_passenger.update(api_v1_passenger_params)
      respond_with :api, :v1, @api_v1_passenger
    else
      respond_with :api, :v1, @api_v1_passenger
    end
  end

  # DELETE /api/v1/passengers/1
  def destroy
    @api_v1_passenger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_passenger
      @api_v1_passenger = Passenger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_passenger_params
      params.permit(
        :id,
        :name,
        :email,
        :phone,
      )
    end
end
