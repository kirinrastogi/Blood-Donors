require 'test_helper'

class RecipientsControllerTest < ActionDispatch::IntegrationTest
  test 'get index response' do
    get recipients_url
    assert_response :ok
  end

  test 'get index response format' do
    get recipients_url
    body = JSON.parse @response.body
    assert_equal 'application/json', @response.content_type
    assert_kind_of Array, body
    assert_kind_of Hash, body[0]
  end

  test 'get index response properties' do
    get recipients_url
    recipient = JSON.parse(@response.body).first
    id, name, email = recipient.values
    assert_equal 'recName1', name
    assert_equal 'recEmail1@email.com', email
    assert_equal 1, id
    assert Recipient.new(recipient).validate
  end

  test 'get show response' do
    get recipients_url + '1/'
    assert_response :ok
    assert_equal 'text/html', @response.content_type
    assert_kind_of String, @response.body
  end

  test 'get show response format' do
    get recipients_url + '2/'
    recipient = @controller.send :show_json
    assert_kind_of Recipient, recipient
  end

  test 'get show response properties' do
    get recipients_url + '2/'
    recipient = @controller.send :show_json
    assert_equal 'recName2', recipient.name
    assert_equal 2, recipient.id
    assert_equal 'recEmail2@email.com', recipient.email
    assert Recipient.new(recipient.attributes).validate
  end

  test 'get affected response' do
    get recipients_url + 'affected/1'
    assert_response :ok
  end

  test 'get affected response format' do
    get recipients_url + 'affected/1'
    assert_response :ok
    assert_equal 'text/html', @response.content_type
    assert_kind_of String, @response.body
  end

  test 'should have a recipient list of right format' do
    get recipients_url + 'affected/1'
    recipients = @controller.send :affected_json
    assert_not recipients.empty?
    assert_equal 2, recipients.length
    assert_kind_of Donor::ActiveRecord_Relation, recipients
    assert_kind_of Donor, recipients[0]
  end

  test 'should have recipient list of length 1' do
    get recipients_url + 'affected/2'
    recipients = @controller.send :affected_json
    assert_equal 1, recipients.length
  end

  test 'should have empty recipient list' do
    get recipients_url + 'affected/3'
    recipients = @controller.send :affected_json
    assert recipients.empty?
  end

end
