class Devices::LocationsController < DevicesController
  def index
    render_json(serializer, locations)
  end

  def show
    render_json(serializer, location)
  end

  def create
    create_locations
    render_json(serializer, locations)
  end

  protected

  def locations
    @locations ||= location_scope.page(params[:page])
  end

  def location
    @location ||= location_scope.find_by(id: params[:location_id] || params[:id])
  end

  def create_locations
    @locations = []
    locations_params.each do |location_params|
      @locations << location_scope.create!(location_params.permit(:latitude, :longitude, :mark_at))
    end
  end

  def location_scope
    device.device_locations
  end

  def locations_params
    params[:locations] || []
  end

  private

  def serializer
    DeviceLocationSerializer
  end
end
