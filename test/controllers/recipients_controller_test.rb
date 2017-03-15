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
    recipient = @controller.send(:show_json)
    assert_kind_of Recipient, recipient
  end

  test 'get show response properties' do
    get recipients_url + '2/'
    recipient = @controller.send(:show_json)
    assert_equal 'recName2', recipient.name
    assert_equal 2, recipient.id
    assert_equal 'recEmail2@email.com', recipient.email
    assert Recipient.new(recipient.attributes).validate
  end
end
