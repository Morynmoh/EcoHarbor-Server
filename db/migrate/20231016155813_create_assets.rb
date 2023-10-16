class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :asset_name
      t.string :asset_category
      t.text :asset_image
      t.string :asset_condition
      t.decimal :purchase_value
      t.decimal :current_value
      t.integer :quantity
      t.references :department, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
