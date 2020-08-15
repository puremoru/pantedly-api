class RequirementsController < ApplicationController
  before_action :get_requirement, only: [:show]

  def index
    render json: { requirements: Requirement.all.order(created_at: :desc) }, status: 200
  end

  def show 
    render json: { requirement: @requirement }, status: 200
  end

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

  def get_requirement
    @requirement = Requirement.find(params[:id])
  end
end
