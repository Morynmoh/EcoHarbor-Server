class RequestsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_request_not_found

  def create
    request = Request.create(request_params)
    render json: request, status: :created
  end

  def index
    render json: Request.all, status: :ok
  end

  def show
    request = find_request
    render json: request, status: :ok
  end

  def update
    request = find_request
    request.update!(request_params)
    render json: request, status: :ok
  end

  def destroy
    request = find_request
    request.destroy!
    head :no_content
  end

  private 

  def request_params
    params.require(:request).permit(:request_type, :new_asset_name, :urgency, :quantity, :reason, :request_date, :request_status, :approval_date, :procurement_comments, :asset_id, :department_id, :employee_id)
  end

  
  def find_request
    request = Request.find(params[:id])
  end

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_request_not_found
    render json: { error: 'Request record not found, try again' }, status: :not_found
  end
end
