class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :configure_permitted_paramaters, if: :devise_controller?

    protected

    def configure_permitted_paramaters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :employee_role, :phone_number, :employment_date, :department_id])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :employee_role, :phone_number, :employment_date, :department_id])
    end
end
