class AddAttributesToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :phone_number, :bigint
    add_column :employees, :employee_role, :text
    add_column :employees, :employment_date, :date
    add_column :employees, :employee_image, :text
    add_reference :employees, :department, null: false, foreign_key: true
  end
end
