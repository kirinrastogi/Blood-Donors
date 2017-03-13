require 'test_helper'

class DonorTest < ActiveSupport::TestCase
  test 'saving with no params' do
    donor = Donor.new
    assert_not donor.save
  end

  test 'saving with just email' do
    donor = Donor.new email: 'email@email.com'
    assert_not donor.save
  end

  test 'saving with just blood_type' do
    donor = Donor.new blood_type: 'a+'
    assert_not donor.save
  end

  test 'saving with just name' do
    donor = Donor.new name: 'kirin'
    assert_not donor.save
  end

  test 'saving with only blood_type and email provided' do
    donor = Donor.new(blood_type: 'a+', email: 'email@email.com')
    assert_not donor.save
  end

  test 'saving with only blood_type and name provided' do
    donor = Donor.new(blood_type: 'a+', name: 'nameTest')
    assert_not donor.save
  end

  test 'saving with only name and email provided' do
    donor = Donor.new(name: 'kirin', email: 'email@email.com')
    assert_not donor.save
  end

  test 'saving with proper parameters supplied' do
    donor = Donor.new(name: 'kirin', email: 'email@email.com', blood_type: 'b+')
    assert donor.save
  end

  test 'saving with invalid email should fail' do
    donor = Donor.new(name: 'kirin', email: 'email', blood_type: 'b+')
    assert_not donor.save
  end

  test 'type invalid' do
    type = 'invalid blood type'
    donor = Donor.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert_not donor.save
  end

  test 'type ab' do
    type = 'ab'
    donor = Donor.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert_not donor.save
  end

  test 'type o--' do
    type = 'o--'
    donor = Donor.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert_not donor.save
  end

  test 'type hello+' do
    type = 'hello+'
    donor = Donor.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert_not donor.save
  end

  test 'type O+' do
    type = 'O+'
    donor = Donor.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert donor.save
  end

  test 'type ab+' do
    type = 'ab+'
    donor = Donor.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert donor.save
  end
end
