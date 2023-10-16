class DepartmentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_department_not_found

  def create
    department = Department.create(department_params)
    render json: department, status: :created
  end

  def index
    render json: Department.all, status: :ok
  end

  def show
    department = find_department
    render json: department, status: :ok
  end


  def update
    department = find_department
    department.update!(department_params)
    render json: department, status: :ok
  end


    #Reassign Employees: Instead of deleting employees when a department is deleted, 
    #you might want to reassign them to another department or set their department ID to null.
  def destroy
    department = find_department
    department.destroy
    head :no_content

  end
        
  #   department = find_department
  #   employees = department.employees

  #   if employees.update_all(department_id: nil)
  #       department.destroy
  #       head :no_content
  #   else
  #       render json: { error: 'Unable to reassign employees.' }, status: :unprocessable_entity
  #   end
  # end

  private 

  def department_params
    params.permit(:department_name, :department_code)
  end

  def find_department
    department = Department.find(params[:id])
  end

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_department_not_found
    render json: { error: 'Department record not found, try again' }, status: :not_found
  end
end
