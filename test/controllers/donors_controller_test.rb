require 'test_helper'

class DonorsControllerTest < ActionDispatch::IntegrationTest
  test 'get index response' do
    get donors_url
    assert_response :ok
  end

  test 'get index response format' do
    get donors_url
    body = JSON.parse @response.body
    assert_equal 'application/json', @response.content_type
    assert_kind_of Array, body
    assert_kind_of Hash, body[0]
  end

  test 'get index response properties' do
    get donors_url
    donor = JSON.parse(@response.body).first
    id, name, email = donor.values
    assert_equal 'name1', name
    assert_equal 'email1@email.com', email
    assert_equal 1, id
    assert Donor.new(donor).validate
  end

  test 'get show response' do
    get donors_url + '1/'
    assert_response :ok
    assert_equal 'text/html', @response.content_type
    assert_kind_of String, body
  end

  test 'get show response format' do
    get donors_url + '2/'
    donor = @controller.send(:show_json)
    assert_kind_of Donor, donor
  end

  test 'get show response properties' do
    get donors_url + '2/'
    donor = @controller.send(:show_json)
    assert_equal 'name2', donor.name
    assert_equal 2, donor.id
    assert_equal 'email2@email.com', donor.email
    assert Donor.new(donor.attributes).validate
  end
end
