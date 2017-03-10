class Donation < ApplicationRecord
  belongs_to :donor
  belongs_to :recipient
  belongs_to :present_nurse
  has_many :nurses, :through => :present_nurses

  def self.validate!(params)
    if not Donor.exists?(params[:donor_id])
      raise ArgumentError, 'Donor does not exist'
    end

    if not Recipient.exists?(params[:recipient_id])
      raise ArgumentError, 'Recipient does not exist'
    end
  end
end
