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
    assert_equal 'donName2', name
    assert_equal 'donEmail2@email.com', email
    assert_equal 2, id
    assert Donor.new(donor).validate
  end

  test 'should be sorted in reverse order for index by id' do
    get donors_url
    donor_ids = JSON.parse(@response.body).map {|donor| donor['id']}
    assert donor_ids.length <= 10
    assert_equal donor_ids, donor_ids.sort.reverse
  end

  test 'get show response' do
    get donors_url + '1/'
    assert_response :ok
    assert_equal 'text/html', @response.content_type
    assert_kind_of String, @response.body
  end

  test 'get show response format' do
    get donors_url + '2/'
    donor = @controller.send(:show_json)
    assert_kind_of Hash, donor
  end

  test 'get show response properties' do
    get donors_url + '2/'
    donor = @controller.send(:show_json)
    id, name, email = donor.values
    assert_equal 'donName2', name
    assert_equal 2, id
    assert_equal 'donEmail2@email.com', email
    assert Donor.new(donor).validate
  end
end
