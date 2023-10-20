# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  private

  def respond_with(employee_user, _opts = {})
    devise_api_token = current_devise_api_token
    if resource.persisted?
      render json: {
        status: { code: 200, message: "Signed In successfully!" },
        data: EmployeeSerializer.new(employee_user).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: { code: 401, message: "Signed In failed!" },
      }
    end
  end

  # def signin
  #   devise_api_token = current_devise_api_token
  #   if devise_api_token
  #     render json: { message: "You are logged in as #{devise_api_token.resource_owner.email}" }, status: :ok
  #   else
  #     render json: { message: 'You are not logged in' }, status: :unauthorized
  #   end
  # end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
