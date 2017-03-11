require 'test_helper'

class DonorsControllerTest < ActionDispatch::IntegrationTest
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

  test 'get show response json' do
    get donors_url + '2/'
    donor = @controller.send(:show_json)
    assert_kind_of Object, donor
    assert_equal donor.name, 'name2'
    assert_equal donor.id, 2
    assert_equal donor.email, 'email2'
  end
end
