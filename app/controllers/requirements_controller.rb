class RequirementsController < ApplicationController
  skip_before_action :authorize_request, only: [:index, :show]

  def index
    if params[:prefecture] || params[:city]
      render json: { requirements: Requirement.search_by_address(params[:prefecture], params[:city]) }, status: 200
    else
      render json: { requirements: Requirement.all.order(created_at: :desc) }, status: 200
    end
  end

  def show 
    render json: { requirement: requirement }, status: 200
  end

  def create
    requirement = @current_user.company.requirements.new(requirement_params)
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

  def requirement
    Requirement.find(params[:id])
  end
end
