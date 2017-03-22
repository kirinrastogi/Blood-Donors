class PresentNurse < ApplicationRecord
  belongs_to :donation
  belongs_to :nurse
  validates :donation_id, :nurse_id, presence: true
  validate :validate_ids

  def validate_ids
    errors.add(:nurse_id, 'is invalid') unless Nurse.exists?(nurse_id)
    errors.add(:donation_id, 'is invalid') unless Donation.exists?(donation_id)
  end
end
