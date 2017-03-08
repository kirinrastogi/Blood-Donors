class Donor < ApplicationRecord
  has_many :donations
  has_many :recipients, :through => :donations
end
