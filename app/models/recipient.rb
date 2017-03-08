class Recipient < ApplicationRecord
  has_many :donations
  has_many :donors, :through => :donations
end
