class Rowempl < ActiveRecord::Base
  attr_accessible :employee_id, :warehouse_id, dependent: :destroy

  belongs_to :warehouse
  belongs_to :employee
end
