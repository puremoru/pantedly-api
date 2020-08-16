class ApplicationController < ActionController::API
  before_action :authorize_request
  def authorize_request
    header = request.headers['Authorization']
    if header
      token = header.split(' ').last
    else
      return render json: { errors: 'Authorization is not given.' }, status: 401
    end

    begin
      payload = JsonWebToken.decode(token)
      @current_user = User.find(payload[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: 401
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: 401
    end
  end
end
