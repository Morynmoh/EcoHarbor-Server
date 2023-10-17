class Asset < ApplicationRecord
  self.table_name = "assetz"
  
  belongs_to :department#, optional: true
  belongs_to :employee#, optional: true
end
