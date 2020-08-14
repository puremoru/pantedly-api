class RequirementsController < ApplicationController
  def create
    requirement = Requirement.new(requirement_params)
    if requirement.save
      render json: { message: 'Created' }, status: 201
    else 
      render json: { message: 'Bad Request' }, status: 400
    end
  end

  private 
  def requirement_params 
    params.permit(
      :title, 
      :initiative, 
      :request_content,
    )
  end
end
