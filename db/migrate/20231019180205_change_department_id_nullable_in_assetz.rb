class ChangeDepartmentIdNullableInAssetz < ActiveRecord::Migration[7.0]
  def change
    change_column_null :assetz, :department_id, null: true
  end
end
