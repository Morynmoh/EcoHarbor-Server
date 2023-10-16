class Request < ApplicationRecord
  belongs_to :asset
  belongs_to :department
  belongs_to :employee
end
