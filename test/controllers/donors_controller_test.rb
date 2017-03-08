require 'test_helper'

class DonorsControllerTest < ActionDispatch::IntegrationTest
  test "should not save without blood_type" do
    donor = Donor.new
    assert_not donor.save
  end
end
