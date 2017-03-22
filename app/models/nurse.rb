class Nurse < ApplicationRecord
  has_many :present_nurses
  has_many :donations, :through => :present_nurses
  validates :email, presence: true, format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }
  validates :name, presence: true
end
