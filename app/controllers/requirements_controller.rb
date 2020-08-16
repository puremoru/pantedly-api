class RequirementsController < ApplicationController
  skip_before_action :authorize_request, only: [:index, :show]
  before_action :get_requirement, only: [:show]
  before_action :get_current_company, only: [:create]

  def index
    render json: { requirements: Requirement.all.order(created_at: :desc) }, status: 200
  end

  def show 
    render json: { requirement: @requirement }, status: 200
  end

  def create
    requirement = @current_company.requirements.new(requirement_params)
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

  def get_current_company
    @current_company = @current_user.company
    if @current_company
      return @current_company
    else
      return render json: { errors: 'Company does not exist.' }, status: 401
    end
  end
end
