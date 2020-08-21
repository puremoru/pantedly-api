class EntriesController < ApplicationController
  def create
    requirement = Requirement.find(params[:requirement_id])
    if requirement.need_reason && !params[:reason]
      return render json: { message: 'Reason Required' }, status: 400
    end

    entry = @current_user.entries.new(entry_params)
    if entry.save
      render json: { message: 'Created' }, status: 201
    else 
      render json: { message: 'Bad Request' }, status: 400
    end
  end

  private
  def entry_params
    params.permit(
      :requirement_id,
      :reason,
    )
  end
end
