class Warehouse < ActiveRecord::Base
  attr_accessible :apps, :hardwaretype_id, :name, :notes, :pdate, :serial, :specs
  attr_accessible :rowempls_attributes

  has_many :rowempls, :dependent => :destroy
  accepts_nested_attributes_for :rowempls
end
