class CompaniesController < ApplicationController
  def create
    company = Company.new(company_params)
    if company.save
      @current_user.update(company_id: company.id)
      render json: { message: 'Created' }, status: 201
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
end
