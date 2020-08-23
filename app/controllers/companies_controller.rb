class CompaniesController < ApplicationController
  skip_before_action :authorize_request, only: [:show]
  def show
    render json: { company: company, requirements: company.requirements }, status: 200
  end

  def create
    company = Company.new(company_params)
    if company.save
      @current_user.update(company_id: company.id)
      render json: { message: 'Created' }, status: 201
    else
      render json: { message: 'Bad Request' }, status: 400 
    end
  end

  def update
    if @current_user.company.update(company_params)
      render json: { message: 'Updated' }, status: 200
    else
      render json: { message: 'Bad Request' }, status: 400
    end
  end

  private
  def company_params 
    params.permit(
      :name,
      :postal_code,
      :prefecture,
      :address1,
      :address2,
    )
  end

  def company
    Company.find(params[:id])
  end
end
