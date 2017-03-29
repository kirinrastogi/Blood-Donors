require 'test_helper'

class PresentNursesControllerTest < ActionDispatch::IntegrationTest
  test 'get index response' do
    get present_nurses_url
    assert_response :ok
  end

  test 'get index response format' do
    get present_nurses_url
    body = JSON.parse @response.body
    assert_equal 'application/json', @response.content_type
    assert_kind_of Array, body
    assert_kind_of Hash, body[0]
  end

  test 'get index response properties' do
    get present_nurses_url
    present_nurse = JSON.parse(@response.body).first
    id, donation_id, nurse_id = present_nurse.values
    assert_equal 3, id
    assert_equal 2, donation_id
    assert_equal 2, nurse_id
    assert PresentNurse.new(present_nurse).validate
  end

  test 'should be sorted in reverse order for index by id' do
    get present_nurses_url
    present_nurse_ids = JSON.parse(@response.body).map {|present_nurse| present_nurse['id']}
    assert present_nurse_ids.length <= 10
    assert_equal present_nurse_ids, present_nurse_ids.sort.reverse
  end

  test 'should be ok response on present_nurses show' do
    get present_nurses_url + '1/'
    assert_response :ok
    #assert_equal 'text/html', @response.content_type
    #assert_kind_of String, @response.body
  end

  test 'should give response when showing data' do
    get present_nurses_url + '1/'
    present_nurse = @controller.send :show_json
    assert_kind_of Hash, present_nurse
  end

  test 'should have right format for show response properties' do
    get present_nurses_url + '2/'
    present_nurse = @controller.send :show_json
    id, donation_id, nurse_id = present_nurse.values
    assert_equal 2, id
    assert_equal 1, donation_id
    assert_equal 1, nurse_id
    assert PresentNurse.new(present_nurse).validate
  end
end
