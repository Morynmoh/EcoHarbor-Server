class ChangeEmployeeIdNullableInAssetz < ActiveRecord::Migration[7.0]
  def change
    change_column :assetz, :employee_id, :bigint, null: true
  end
end
