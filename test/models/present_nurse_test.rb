require 'test_helper'

class PresentNurseTest < ActiveSupport::TestCase
  test 'should not save with no params' do
    present_nurse = PresentNurse.new
    assert_not present_nurse.save
  end

  test 'should not save with just donation_id' do
    present_nurse = PresentNurse.new donation_id: 1
    assert_not present_nurse.save
  end

  test 'should not save with just nurse_id' do
    present_nurse = PresentNurse.new nurse_id: 1
    assert_not present_nurse.save
  end

  test 'should save with both ids given' do
    present_nurse = PresentNurse.new nurse_id: 1, donation_id: 1
    assert present_nurse.save!
  end

  test 'should save with valid ids' do
    present_nurse = PresentNurse.new(nurse_id: 1, donation_id: 2)
    assert present_nurse.save
  end

  test 'should not save with invalid nurse_ id' do
    present_nurse = PresentNurse.new nurse_id: 300, donation_id: 2
    assert_not present_nurse.save
  end

  test 'should not save with invalid donation_id' do
    present_nurse = PresentNurse.new nurse_id: 1, donation_id: 300
    assert_not present_nurse.save
  end

  test 'should not save with invalid ids' do
    present_nurse = PresentNurse.new nurse_id: 300, donation_id: 300
    assert_not present_nurse.save
  end
end
