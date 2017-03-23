class Donation < ApplicationRecord
  belongs_to :donor
  belongs_to :recipient
  has_many :nurses, :through => :present_nurses
  validates :donor_id, :recipient_id, presence: true
  validate :validate_ids

  def validate_ids
    errors.add(:donor_id, 'is invalid') unless Donor.exists?(donor_id)
    errors.add(:recipient_id, 'is invalid') unless Recipient.exists?(recipient_id)
  end
end
