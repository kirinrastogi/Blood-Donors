class Donor < ApplicationRecord
  has_many :transactions
  has_many :recipients, :through => :transactions
end
