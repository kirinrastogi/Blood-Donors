class Donor < ApplicationRecord
  has_many :donations
  has_many :recipients, :through => :donations
  validates :email, :name, presence: true
  validates :blood_type, presence: true, format: { with: /\A(a|b|ab|o)[+-]\z/ }
end
