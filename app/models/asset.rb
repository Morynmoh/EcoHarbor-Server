class Asset < ApplicationRecord
  belongs_to :department, optional: true
  belongs_to :employee, optional: true
end
