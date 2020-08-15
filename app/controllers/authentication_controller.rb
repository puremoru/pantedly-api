class AuthenticationController < ApplicationController
  def signup
    user = User.new(signup_params)
    if user.save
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), email: params[:email]}, status: 200
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), email: params[:email]}, status: 200
    else
      render json: { error: 'unauthorized' }, status: 401
    end
  end

  private
  def signup_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def login_params 
    params.permit(:email, :password)
  end
end
