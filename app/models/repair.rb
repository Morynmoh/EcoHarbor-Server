class Repair < ApplicationRecord
  belongs_to :asset
  belongs_to :request
  belongs_to :department
  belongs_to :employee
end
