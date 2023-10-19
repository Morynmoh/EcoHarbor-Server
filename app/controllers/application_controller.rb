class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :employee_role, :phone_number, :employment_date, :department_id])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :employee_role, :phone_number, :employment_date, :department_id])
    end


    def assetz_params
        params.permit(:asset_name, :asset_category, :asset_image, :asset_condition, :purchase_value, :current_value, :quantity)
    end
end
