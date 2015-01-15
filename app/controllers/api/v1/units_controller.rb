module Api
	module V1
		class UnitsController < ApplicationController

			before_filter :restrict_access
			respond_to :html, :json

			def show
				respond_with Unit.find(params[:id])
			end
			def create
				unit = Unit.new(unit_params)
				if unit.save
					render json: unit, status: 201, location: [:api, unit]
				else
					render json: { errors: unit.errors }, status: 422
				end
			end

			private
			def unit_params
				params.require(:unit).permit(:name)
			end

			def restrict_access
				authenticate_or_request_with_http_token do |token, options|
					ApiKey.exists?(access_token: token)
				end
			end
		end
	end
end
