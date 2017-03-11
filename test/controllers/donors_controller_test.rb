require 'test_helper'

class DonorsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @donor = donors(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test 'get index response' do
    get donors_url
    body = JSON.parse @response.body
    assert_response :ok
    assert_equal 'application/json', @response.content_type
    assert_kind_of Array, body
    assert_kind_of Hash, body[0]
    assert Donor.new(body.first).validate
  end

  test 'get show response' do
    get donors_url + '1/'
    assert_response :ok
    assert_equal 'text/html', @response.content_type
    assert_kind_of String, body
  end
end
