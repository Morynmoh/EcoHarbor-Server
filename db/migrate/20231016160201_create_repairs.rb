class CreateRepairs < ActiveRecord::Migration[7.0]
  def change
    create_table :repairs do |t|
      t.integer :quantity
      t.date :checkin_date
      t.date :checkout_date
      t.text :repair_comments
      t.references :asset, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
