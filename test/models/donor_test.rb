require 'test_helper'

class DonorTest < ActiveSupport::TestCase
  test 'saving with no params' do
    donor = Donor.new
    assert_not donor.save
  end

  test 'saving with just email' do
    donor = Donor.new email: 'email'
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
    donor = Donor.new(blood_type: 'a+', email: 'emailTest')
    assert_not donor.save
  end

  test 'saving with only blood_type and name provided' do
    donor = Donor.new(blood_type: 'a+', name: 'nameTest')
    assert_not donor.save
  end

  test 'saving with only name and email provided' do
    donor = Donor.new(name: 'kirin', email: 'emailTest')
    assert_not donor.save
  end

  test 'saving with proper parameters supplied' do
    donor = Donor.new(name: 'kirin', email: 'emailTest', blood_type: 'b+')
    assert donor.save
  end

  test 'type invalid' do
    type = 'invalid blood type'
    assert_raises ArgumentError do
      Donor.validate_type! type
    end
  end

  test 'type ab' do
    type = 'ab'
    assert_raises ArgumentError do
      Donor.validate_type! type
    end
  end

  test 'type o--' do
    type = 'o--'
    assert_raises ArgumentError do
      Donor.validate_type! type
    end
  end

  test 'type hello+' do
    type = 'hello+'
    assert_raises ArgumentError do
      Donor.validate_type! type
    end
  end

  test 'type O+' do
    type = 'O+'
    assert_nothing_raised do
      Donor.validate_type! type
    end
  end

  test 'type ab+' do
    type = 'ab+'
    assert_nothing_raised do
      Donor.validate_type! type
    end
  end
end
