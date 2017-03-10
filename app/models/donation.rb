class Donation < ApplicationRecord
  belongs_to :donor
  belongs_to :recipient
  belongs_to :present_nurse
  has_many :nurses, :through => :present_nurses
end
