require 'test_helper'

class RecipientTest < ActiveSupport::TestCase
  test 'saving with no params' do
    recipient = Recipient.new
    assert_not recipient.save
  end

  test 'saving with just email' do
    recipient = Recipient.new email: 'email@email.com'
    assert_not recipient.save
  end

  test 'saving with just blood_type' do
    recipient = Recipient.new blood_type: 'a+'
    assert_not recipient.save
  end

  test 'saving with just name' do
    recipient = Recipient.new name: 'kirin'
    assert_not recipient.save
  end

  test 'saving with only blood_type and email provided' do
    recipient = Recipient.new(blood_type: 'a+', email: 'email@email.com')
    assert_not recipient.save
  end

  test 'saving with only blood_type and name provided' do
    recipient = Recipient.new(blood_type: 'a+', name: 'nameTest')
    assert_not recipient.save
  end

  test 'saving with only name and email provided' do
    recipient = Recipient.new(name: 'kirin', email: 'email@email.com')
    assert_not recipient.save
  end

  test 'saving with proper parameters supplied' do
    recipient = Recipient.new(name: 'kirin', email: 'email@email.com', blood_type: 'b+')
    assert recipient.save
  end

  test 'saving with invalid email should fail' do
    recipient = Recipient.new(name: 'kirin', email: 'email', blood_type: 'b+')
    assert_not recipient.save
  end

  test 'type invalid' do
    type = 'invalid blood type'
    recipient = Recipient.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert_not recipient.save
  end

  test 'type ab' do
    type = 'ab'
    recipient = Recipient.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert_not recipient.save
  end

  test 'type o--' do
    type = 'o--'
    recipient = Recipient.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert_not recipient.save
  end

  test 'type hello+' do
    type = 'hello+'
    recipient = Recipient.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert_not recipient.save
  end

  test 'type O+' do
    type = 'O+'
    recipient = Recipient.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert recipient.save
  end

  test 'type ab+' do
    type = 'ab+'
    recipient = Recipient.new(name: 'kirin', email: 'email@email.com', blood_type: type)
    assert recipient.save
  end
end
