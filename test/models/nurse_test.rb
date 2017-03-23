require 'test_helper'

class NurseTest < ActiveSupport::TestCase
  test 'should not save with no params' do
    nurse = Nurse.new
    assert_not nurse.save
  end

  test 'should not save with just email' do
    nurse = Nurse.new email: 'email@email.com'
    assert_not nurse.save
  end

  test 'should not save with just name' do
    nurse = Nurse.new name: 'nurseName'
    assert_not nurse.save
  end

  test 'should save with only name and email provided' do
    nurse = Nurse.new(name: 'nurseName', email: 'email@email.com')
    assert nurse.save
  end

  test 'should not save with invalid email should fail' do
    nurse = Nurse.new(name: 'nurseName', email: 'email')
    assert_not nurse.save
  end
end
