class PollenCount < ActiveRecord::Base
  validates_numericality_of [:grass, :weeds, :fungi, :trees], :on => :create, :message => "is not a number"
  validate :weekday?
  
  def weekday?
    errors.add(:date, "Must be a weekday") unless self.date.weekday?
  end
  
end
