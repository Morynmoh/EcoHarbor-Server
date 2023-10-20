class EmployeesController < ApplicationController
  respond_to :json
      skip_before_action :verify_authenticity_token, only: [:create]
      before_action :authenticate_employee!
      # before_action :configure_permitted_parameters
      before_action :set_employee, only: [:show]

  def index
    @employees = Employee.all
    render json: @employees
  end

  # POST /employeesemployee: {
  #       email: email,
  #       password: password,
  #     }
  # def create
  #   @employee = Employee.new(employee_params)
  #
  #   if @employee.save
  #     render json: @employee, status: :created
  #   else
  #     render json: @employee.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # GET /employees/:id
  def show
    render json: @employee
  end

  # PATCH/PUT /employees/:id
  def update
    @employee = Employee.find(params[:id])
    remove_blank_fields
    if resource.persisted?
      render json: {
        status: { code: 200, message: "Updated successfully!" },
        data: EmployeeSerializer.new(@employee).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: { code: 401, message: "Updated failed!" },
      }
    end
  end
  # DELETE /employees/:id
  #
  #
  def destroy
    @employee.destroy
  end


# protected
#       def configure_permitted_parameters
#         devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :employee_role, :phone_number, :employment_date, :department_id])
#       end
  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :first_name, :last_name, :email, :phone_number,
      :password, :employment_date, :department_id, :employee_role, :employee_image
    )
  end
  def remove_blank_fields
        params[:employee].delete_if { |key, value| value.blank? }
  end
end
