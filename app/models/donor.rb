class Donor < ApplicationRecord
  has_many :donations
  has_many :recipients, :through => :donations
  validates :email, :blood_type, :name, presence: true

  def self.validate_type!(type)
    if not !!(type.downcase=~ /^(a|b|ab|o)[+-]$/)
      raise ArgumentError, 'Invalid blood_type'
    end
  end
end
