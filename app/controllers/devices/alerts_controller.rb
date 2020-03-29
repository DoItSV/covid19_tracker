class Devices::AlertsController < ApplicationController
  def index
    render_json(serializer, alerts)
  end

  def show
    render_json(serializer, alert)
  end

  def create
    build_alert
    return render_json(serializer, alert) if save_alert

    render json: { errors: alert.errors.full_messages }, status: :bad_request
  end

  protected

  def alerts
    @alerts ||= alert_scope.page(params[:page])
  end

  def alert
    @alert ||= alert_scope.find_by(id: params[:alert_id] || params[:id])
  end

  def build_alert
    @alert ||= alert_scope.build
    @alert.assign_attributes(alert_params)
  end

  def save_alert
    @alert.save
  end

  def alert_scope
    device.device_alerts
  end

  def alert_params
    alert_params = params[:alert]
    return {} unless alert_params

    alert_params.permit(:alert)
  end

  private

  def serializer
    DevicealertSerializer
  end
end
