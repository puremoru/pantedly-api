class InterestsController < ApplicationController
  def create
    interest = @current_user.interests.new(interest_params)
    if interest.save
      render json: { message: 'Created' }, status: 201
    else
      render json: { message: 'Bad Request' }, status: 400  
    end
  end

  private
  def interest_params
    params.permit(
      :degree,
      :requirement_id,
    )
  end
end
