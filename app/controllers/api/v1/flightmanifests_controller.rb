class Api::V1::FlightmanifestsController < ApplicationController
    before_action :set_api_v1_flightmanifest, only: [:show]
    respond_to :json

    # GET /api/v1/flightmanifests
    def index
      @api_v1_flightmanifests = Flightmanifest.all
      render json: @api_v1_flightmanifests
    end
  
    # GET /api/v1/flightmanifests/1
    def show
      render json: @api_v1_flightmanifest
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_api_v1_flightmanifest
        @api_v1_flightmanifest = Flightmanifest.where(flightofferings_id: params[:flightofferings_id])
      end
  
end
