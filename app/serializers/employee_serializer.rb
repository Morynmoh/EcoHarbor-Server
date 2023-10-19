class EmployeeSerializer
  include JSONAPI::Serializer
  attributes :email, :first_name, :last_name, :password, :phone_number, :employee_role, :employment_date, :department_id
end
