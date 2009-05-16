class PollenCount < ActiveRecord::Base
  validates_uniqueness_of :date, :on => :create, :message => "must be unique"
  validates_numericality_of [:grass, :weeds, :fungi, :trees], :on => :create, :message => "is not a number"
end
