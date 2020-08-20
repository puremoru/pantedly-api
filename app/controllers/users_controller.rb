class UsersController < ApplicationController
  before_action :is_recruiter, only: [:index]
  def index
    render json: { users: User.where(company_id: nil) }, status: 200 # TODO: 並び順をどうするか考える
  end

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

  def is_recruiter
    if !@current_user.company
      return render json: { message: 'Forbidden' }, status: 403
    end
  end
end
