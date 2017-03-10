class Nurse < ApplicationRecord
  has_many :present_nurses
  has_many :donations, :through => :present_nurses
end
