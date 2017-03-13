class Donor < ApplicationRecord
  has_many :donations
  has_many :recipients, :through => :donations
  validates :email, presence: true, format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }
  validates :name, presence: true
  validates :blood_type, presence: true, format: { with: /\A(a|b|ab|o)[+-]\z/i }
end
