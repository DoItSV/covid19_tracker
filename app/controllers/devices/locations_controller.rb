class Devices::LocationsController < ApplicationController
  def index
    render_json(serializer, locations)
  end

  def show
    render_json(serializer, location)
  end

  def create
    build_location
    return render_json(serializer, location) if save_location

    render json: { errors: location.errors.full_messages }, status: :bad_request
  end

  protected

  def locations
    @locations ||= location_scope.page(params[:page])
  end

  def location
    @location ||= location_scope.find_by(id: params[:location_id] || params[:id])
  end

  def build_location
    @location ||= location_scope.build
    @location.assign_attributes(location_params)
  end

  def save_location
    @location.save
  end

  def location_scope
    device.device_locations
  end

  def location_params
    location_params = params[:location]
    return {} unless location_params

    location_params.permit(:latitude, :longitude, :mark_at)
  end

  private

  def serializer
    DeviceLocationSerializer
  end
end
