require 'test_helper'

class DonationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @controller = DonationsController.new
  end

  teardown do
    Rails.cache.clear
  end

  test 'should be ok response on donations index' do
    get donations_url
    assert_response :ok
  end

  test 'should be ok format for index response' do
    get donors_url
    body = JSON.parse @response.body
    assert_equal 'application/json', @response.content_type
    assert_kind_of Array, body
    assert_kind_of Hash, body[0]
  end

  test 'should be ok response on donations show' do
    get donations_url + '1/'
    assert_response :ok
  end

  test 'should give response when showing data' do
    donation = @controller.send :show_json, 1
  end
end
