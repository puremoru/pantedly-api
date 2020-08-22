class ScoutsController < ApplicationController
  def create
    if @current_user.id == params[:user_id].to_i
      return render json: { message: 'Cannot scout yourself' }, status: 400
    end

    scout = @current_user.company.scouts.new(scout_params)
    if scout.save
      render json: { message: 'Created' }, status: 201
    else
      render json: { message: 'Bad Request' }, status: 400
    end
  end

  private
  def scout_params
    params.permit(
      :degree,
      :user_id,
    )
  end
end
