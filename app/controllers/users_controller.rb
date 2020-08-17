class UsersController < ApplicationController
  def update
    if @current_user.update(user_params)
      render json: { message: 'Updated' }, status: 200
    else
      render json: { message: 'Bad Request' }, status: 400
    end
    
  end

  private
  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :about,
    )
  end
end
