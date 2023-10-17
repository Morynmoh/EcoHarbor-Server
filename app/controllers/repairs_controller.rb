class RepairsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_repair_not_found

    def create
        repair = Repair.create(repair_params)
        render json: repair, status: :created
    end

    def index
        render json: Repair.all, status: :ok
    end

    def show
        repair = find_repair
        render json: repair, status: :ok
    end

    def update
        repair = find_repair
        repair.update!(repair_params)
        render json: repair, status: :ok
    end

    def destroy
        repairs = find_repair
        repairs.destroy!
        head :no_content
    end

    private 

    def repair_params
        params.permit(:quantity, :checkin_date, :checkout_date, :repair_comments, :asset_id, :request_id, :department_id, :employee_id)
    end

    def find_repair
        repair = Repair.find(params[:id])
    end

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_repair_not_found
        render json: { error: 'Repair record not found, try again' }, status: :not_found
    end
end
