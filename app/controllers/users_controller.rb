class UsersController < ApplicationController
  before_action :is_recruiter, only: [:index, :show]
  def index
    if params[:prefecture] || params[:city]
      render json: { users: User.search_by_address(params[:prefecture], params[:city]) }, status: 200
    else
      render json: { users: User.where(company_id: nil) }, status: 200
    end
  end

  def show
    render json: { user: User.find(params[:id]) }, status: 200
  end

  def update
    if @current_user.update(user_params)
      render json: { message: 'Updated' }, status: 200
    else
      render json: { message: 'Bad Request' }, status: 400
    end
  end

  def get_collocutors
    render json: { collocutors: User.get_collocutors(@current_user.id) }, status: 200
  end

  private
  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :about,
      :postal_code,
      :prefecture, 
      :address1,
      :address2,
    )
  end

  def is_recruiter
    if !@current_user.company
      return render json: { message: 'Forbidden' }, status: 403
    end
  end
end
