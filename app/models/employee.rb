class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api, :jwt_authenticatable, jwt_revocation_strategy: self

  belongs_to :department, class_name: 'Department', foreign_key: 'department_id'
  enum role: { employee: 0, procurement_manager: 1, finance_manager: 2, admin: 3 }
  def set_default_role
    self.employee_role ||= :employee
  end
end
