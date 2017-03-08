class Recipient < ApplicationRecord
  has_many :transactions
  has_many :donors, :through => :transactions
end
