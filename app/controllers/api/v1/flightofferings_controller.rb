class Api::V1::FlightofferingsController < ApplicationController
  before_action :set_api_v1_flightoffering, only: [:show, :update, :destroy]
  respond_to :json
  # GET /api/v1/flightofferings
  def index
    @api_v1_flightofferings = Flightoffering.all
    render json: @api_v1_flightofferings
  end

  # GET /api/v1/flightofferings/1
  def show
    render json: @api_v1_flightoffering
  end

  # POST /api/v1/flightofferings
  def create
   @api_v1_flightoffering = Flightoffering.new(api_v1_flightoffering_params)
    if @api_v1_flightoffering.save
      #redirect_to @article, notice: 'Article was successfully created.'
      #@response = render json: @api_v1_flightoffering, status: :created, location: @api_v1_flightoffering
      respond_with :api, :v1, @api_v1_flightoffering
    else
      #render json: @api_v1_flightoffering.errors, status: :unprocessable_entity
      respond_with :api, :v1, @api_v1_flightoffering
    end
  end

  # PATCH/PUT /api/v1/flightofferings/1
  def update
    if @api_v1_flightoffering.update(api_v1_flightoffering_params)
      #render json: @api_v1_flightoffering
      respond_with :api, :v1, @api_v1_flightoffering
    else
      #render json: @api_v1_flightoffering.errors, status: :unprocessable_entity
      respond_with :api, :v1, @api_v1_flightoffering
    end
  end

  # DELETE /api/v1/flightofferings/1
  def destroy
    @api_v1_flightoffering.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_flightoffering
      @api_v1_flightoffering = Flightoffering.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_flightoffering_params
      params.permit(
        :id,
        :passenger_capacity,
        :departure_location,
        :arrival_location,
        :departure_time,
        :arrival_time,
      )
    end
end
