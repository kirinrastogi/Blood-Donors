require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  test 'should not save with no params' do
    donation = Donation.new
    assert_not donation.save
  end

  test 'should not save with just recipient_id' do
    donation = Donation.new recipient_id: 1
    assert_not donation.save
  end

  test 'should not save with just donor_id' do
    donation = Donation.new donor_id: 1
    assert_not donation.save
  end

  test 'should save with both ids given' do
    donation = Donation.new donor_id: 1, recipient_id: 1
    assert donation.save!
  end
end
