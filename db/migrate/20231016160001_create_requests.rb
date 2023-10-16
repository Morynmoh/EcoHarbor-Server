class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :request_type
      t.string :new_asset_name
      t.text :urgency
      t.integer :quantity
      t.text :reason
      t.date :request_date
      t.text :request_status
      t.date :approval_date
      t.text :procurement_comments
      t.references :asset, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
