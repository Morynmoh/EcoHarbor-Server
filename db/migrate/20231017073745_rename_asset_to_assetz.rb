class RenameAssetToAssetz < ActiveRecord::Migration[7.0]
  def change
    rename_table :assets, :assetz
  end
end
