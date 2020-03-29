class DevicesController < ApplicationController
  def show
    render_json(serializer, device)
  end

  def create
    build_device
    return render_json(serializer, device) if save_device

    render json: { errors: device.errors.full_messages }, status: :bad_request
  end

  protected

  def device
    @device ||= device_scope.find_by(id: params[:device_id] || params[:id])
  end

  def build_device
    @device ||= device_scope.build
    @device.assign_attributes(device_params)
  end

  def save_device
    @device.save
  end

  def device_scope
    Device.where(active: true)
  end

  def device_params
    device_params = params[:device]
    return {} unless device_params

    device_params.permit(:family, :name, :os, :local_id)
  end

  private

  def serializer
    DeviceSerializer
  end
end
